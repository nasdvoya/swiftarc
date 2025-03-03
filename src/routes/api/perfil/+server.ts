import type { RequestHandler } from './$types';
import { json } from '@sveltejs/kit';
import { PrismaClient, Prisma } from '@prisma/client';

const prisma = new PrismaClient();

export const POST: RequestHandler = async ({ request }) => {
	try {
		const formData = await request.json();

		const perfil = await prisma.perfil.create({
			data: {
				nome: formData.nome,
				email: formData.email?.trim() || null,
				horario: formData.horario,
				doador: formData.doador ?? false,
				local_cobranca: formData.local_cobranca,
				morada: formData.morada,
				freguesia: formData.freguesia,
				concelho: formData.concelho,
				codigo_postal: formData.codigo_postal,
				observacoes: formData.observacoes
			}
		});

		if (!(formData.tel_residencial || formData.tel_trabalho || formData.telemovel)) {
			return json({ message: 'Pelo menos um número de telefone é obrigatório.' }, { status: 400 });
		}

		// Trim and validate phone numbers
		const phoneNumbers = [];
		if (formData.tel_residencial?.trim()) {
			phoneNumbers.push({ number: formData.tel_residencial.trim(), type: 'residencial' });
		}
		if (formData.tel_trabalho?.trim()) {
			phoneNumbers.push({ number: formData.tel_trabalho.trim(), type: 'trabalho' });
		}
		if (formData.telemovel?.trim()) {
			phoneNumbers.push({ number: formData.telemovel.trim(), type: 'telemovel' });
		}
		const failedNumbers = [];

		// Insert phone numbers, ensuring unique values for each number
		for (const phone of phoneNumbers) {
			try {
				await prisma.phoneNumber.create({
					data: {
						number: phone.number,
						type: phone.type,
						perfilId: perfil.id
					}
				});
			} catch (error: unknown) {
				if (error instanceof Prisma.PrismaClientKnownRequestError && error.code === 'P2002') {
					failedNumbers.push(phone.number);
				} else {
					console.error('Error inserting phone number, error: ', error);
				}
			}
		}

		if (failedNumbers.length > 0) {
			const failedNumbersString = failedNumbers.join(', ');
			return json(
				{ message: `O numero/s indicados ja existem: ${failedNumbersString}.` },
				{ status: 400 }
			);
		}

		return json({ message: 'Perfil criado com sucesso!', id: perfil.id }, { status: 201 });
	} catch (error: unknown) {
		console.error('Erro no backend:', error);
		return json({ message: 'Erro interno no servidor.', error: error }, { status: 500 });
	}
};

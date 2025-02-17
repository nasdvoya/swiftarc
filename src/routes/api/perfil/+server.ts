import type { RequestHandler } from './$types';
import { json } from '@sveltejs/kit';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export const POST: RequestHandler = async ({ request }) => {
	try {
		const formData = await request.json();

		if (!formData.nome || !formData.email) {
			return json({ message: 'Nome e Email são obrigatórios.' }, { status: 400 });
		}

		const perfil = await prisma.perfil.create({
			data: {
				nome: formData.nome,
				email: formData.email,
				horario: formData.horario,
				doador: formData.doador ?? false,
				local_cobranca: formData.local_cobranca,
				morada: formData.morada,
				freguesia: formData.freguesia,
				concelho: formData.concelho,
				codigo_postal: formData.codigo_postal,
				tel_residencial: formData.tel_residencial,
				tel_trabalho: formData.tel_trabalho,
				telemovel: formData.telemovel,
				observacoes: formData.observacoes
			}
		});

		return json({ message: 'Perfil criado com sucesso!', id: perfil.id }, { status: 201 });
	} catch (error) {
		console.error('Erro no backend:', error);
		return json({ message: 'Erro interno no servidor.' }, { status: 500 });
	}
};

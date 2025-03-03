<script lang="ts">
	import Input from '$lib/Input.svelte';
	import Checkbox from '$lib/Checkbox.svelte';
	import { goto } from '$app/navigation';

	let formData = $state({
		nome: '',
		email: '',
		horario: '',
		doador: false,
		local_cobranca: '',
		morada: '',
		freguesia: '',
		concelho: '',
		codigo_postal: '',
		tel_residencial: '',
		tel_trabalho: '',
		telemovel: '',
		observacoes: ''
	});

	let successMessage = $state('');
	let errorMessage = $state('');

	function isValidPhoneNumber(phone: string): boolean {
		const portuguesePhonePattern = /^(?:\+351\s?)?(9\d{8}|2\d{8})$/;
		return portuguesePhonePattern.test(phone.trim());
	}

	let isDisabled = $derived(
		isValidPhoneNumber(formData.telemovel) ||
			isValidPhoneNumber(formData.tel_trabalho) ||
			isValidPhoneNumber(formData.tel_residencial)
	);

	async function handleSubmit(event: Event) {
		console.log('Sending data:', formData);
		event.preventDefault();

		successMessage = '';
		errorMessage = '';

		try {
			const response = await fetch('/api/perfil', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify({ ...formData })
			});

			const data = await response.json();

			if (response.ok) {
				successMessage = 'Perfil criado com sucesso!';
				setTimeout(() => goto('/'), 2000);
			} else {
				errorMessage = data.message || 'Erro ao criar o perfil.';
			}
		} catch (error) {
			errorMessage = 'Falha na conexão com o servidor.';
		}
	}
</script>

<div class="max-w-4xl mx-auto p-6">
	<h2 class="text-5xl font-bold mb-12 text-center">Perfil temporário</h2>

	<form onsubmit={handleSubmit}>
		<div class="grid grid-cols-2 gap-x-8 gap-y-4 text-left">
			<!-- Left Column -->
			<div>
				<Input
					name="nome"
					label="Nome"
					pattern="^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$"
					errorMessage="O nome nao pode conter simbolos ou numeros!"
					placeholder="John Doe"
					bind:value={formData.nome}
				/>
				<Input
					name="email"
					label="Email"
					pattern="^[^@]+@[^@]+\.[^@]+$"
					errorMessage="Email inválido!"
					placeholder="johndoe@example.com"
					bind:value={formData.email}
				/>
				<Input
					name="horario"
					label="Horário"
					pattern="^(?:[01]\d|2[0-3]):[0-5]\d$"
					errorMessage="Hora inválida!"
					placeholder="HH:MM"
					bind:value={formData.horario}
				/>
				<Checkbox name="doador" label="Doador" bind:checked={formData.doador} />
				<Input
					name="local_cobranca"
					label="Local de Cobrança"
					placeholder="Local de Cobrança"
					bind:value={formData.local_cobranca}
				/>
			</div>
			<!-- Right Column -->
			<div>
				<Input name="morada" label="Morada" placeholder="Morada" bind:value={formData.morada} />
				<Input
					name="freguesia"
					label="Freguesia"
					placeholder="Freguesia"
					bind:value={formData.freguesia}
				/>
				<Input
					name="concelho"
					label="Concelho"
					placeholder="Concelho"
					bind:value={formData.concelho}
				/>
				<Input
					name="codigo_postal"
					label="C.P."
					pattern="^\d{4}-\d{3}$"
					placeholder="Código Postal"
					errorMessage="Código Postal inválido!"
					bind:value={formData.codigo_postal}
				/>
				<Input
					name="tel_residencial"
					label="Tel. Residencial"
					placeholder="Telefone Residencial"
					errorMessage="Número de telefone inválido!"
					bind:value={formData.tel_residencial}
				/>
				<Input
					name="tel_trabalho"
					label="Tel. Trabalho"
					placeholder="Telefone Trabalho"
					errorMessage="Número de telefone inválido!"
					bind:value={formData.tel_trabalho}
				/>
				<Input
					name="telemovel"
					label="Telemóvel"
					placeholder="Telemóvel"
					errorMessage="Número de telefone inválido!"
					bind:value={formData.telemovel}
				/>
			</div>

			<div class="col-span-2">
				<div class="flex items-center mb-6">
					<textarea
						name="observacoes"
						placeholder="Observações"
						class="textarea textarea-bordered textarea-lg rounded-lg w-full focus:outline-none rounded-lg"
						bind:value={formData.observacoes}
					></textarea>
				</div>
			</div>

			<button
				type="button"
				class="btn btn-xs sm:btn-sm md:btn-md lg:btn-lg fixed rounded-full bottom-11 left-10 h-20 mb-14"
				onclick={() => goto('/')}
			>
				Cancelar
			</button>

			<button
				type="submit"
				class="btn btn-xs sm:btn-sm md:btn-md lg:btn-lg btn-success fixed rounded-full bottom-11 right-10 h-20 mb-14"
				disabled={!isDisabled}
			>
				Criar perfil
			</button>
		</div>
	</form>

	{#if successMessage}
		<p class="text-green-500 text-center mt-4">{successMessage}</p>
	{/if}
	{#if errorMessage}
		<p class="text-red-500 text-center mt-4">{errorMessage}</p>
	{/if}
</div>

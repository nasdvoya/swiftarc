<script lang="ts">
	import Input from '$lib/Input.svelte';
	import Checkbox from '$lib/Checkbox.svelte';
	import { onMount } from 'svelte';

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

	function isValidPhoneNumber(phone: string): boolean {
		const portuguesePhonePattern = /^(?:\+351\s?)?(9\d{8}|2\d{8})$/;
		return portuguesePhonePattern.test(phone.trim());
	}

	let isDisabled = $derived(
		() =>
			(formData.telemovel.trim() !== '' && isValidPhoneNumber(formData.telemovel)) ||
			(formData.tel_residencial.trim() !== '' && isValidPhoneNumber(formData.tel_residencial)) ||
			(formData.tel_trabalho.trim() !== '' && isValidPhoneNumber(formData.tel_trabalho))
	);

	let isLoading = false;
	let successMessage = '';
	let errorMessage = '';

	async function handleSubmit(event: Event) {
		event.preventDefault();

		isLoading = true;
		successMessage = '';
		errorMessage = '';

		try {
			const response = await fetch('https://your-backend.com/api/perfil', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(formData)
			});

			const data = await response.json();

			if (response.ok) {
				successMessage = 'Perfil criado com sucesso!';
			} else {
				errorMessage = data.message || 'Erro ao criar o perfil.';
			}
		} catch (error) {
			errorMessage = 'Falha na conexão com o servidor.';
		} finally {
			isLoading = false;
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
					type={'test'}
					required={false}
					title={'test'}
					pattern={'test'}
					maxlength={1}
					errorMessage={'error'}
					name={'nome'}
					label="Nome"
					placeholder="John Doe"
					bind:value={formData.nome}
				/>
				<Input
					name="email"
					label="Email"
					type="email"
					placeholder="johndoe@example.com"
					bind:value={formData.email}
					pattern="^[^@]+@[^@]+\.[^@]+$"
					required
					errorMessage="Email inválido!"
				/>
				<Input name="horario" label="Horário" placeholder="HH:MM" bind:value={formData.horario} />
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
					placeholder="Código Postal"
					bind:value={formData.codigo_postal}
					maxlength={8}
					required
					errorMessage="Código Postal inválido!"
				/>
				<Input
					name="tel_residencial"
					label="Tel. Residencial"
					placeholder="Telefone Residencial"
					bind:value={formData.tel_residencial}
					pattern="^(9\d{8}|2\d{8})$"
					maxlength={9}
					errorMessage="Número de telefone inválido!"
				/>
				<Input
					name="tel_trabalho"
					label="Tel. Trabalho"
					placeholder="Telefone Trabalho"
					bind:value={formData.tel_trabalho}
					pattern="^(9\d{8}|2\d{8})$"
					maxlength={9}
					errorMessage="Número de telefone inválido!"
				/>
				<Input
					name="telemovel"
					label="Telemóvel"
					placeholder="Telemóvel"
					bind:value={formData.telemovel}
					pattern="^(9\d{8}|2\d{8})$"
					maxlength={9}
					errorMessage="Número de telefone inválido!"
				/>
			</div>

			<div class="col-span-2">
				<div class="flex items-center mb-6">
					<textarea
						name="observacoes"
						placeholder="Observações"
						class="textarea textarea-bordered textarea-lg rounded-lg w-full"
						bind:value={formData.observacoes}
					></textarea>
				</div>
			</div>

			<button
				type="button"
				class="btn btn-xs sm:btn-sm md:btn-md lg:btn-lg fixed rounded-full bottom-11 left-10 h-20 mb-14"
			>
				Cancelar
			</button>

			<button
				type="submit"
				class="btn btn-xs sm:btn-sm md:btn-md lg:btn-lg btn-success fixed rounded-full bottom-11 right-10 h-20 mb-14"
				disabled={!isDisabled()}
			>
				{isLoading ? 'Enviando...' : 'Criar perfil'}
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

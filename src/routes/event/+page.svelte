<script lang="ts">
	import Input from '$lib/Input.svelte';
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
</script>

<div class="max-w-4xl mx-auto p-6">
	<h2 class="text-5xl font-bold mb-12 text-center">Perfil temporário</h2>

	<form>
		<div class="grid grid-cols-2 gap-x-8 gap-y-4 text-left">
			<!-- Left Column -->
			<div>
				<Input
					name="data"
					label="Data de ligação"
					pattern=""
					errorMessage="TODO"
					placeholder="22/03/91"
					bind:value={formData.nome}
				/>
				<Input
					name="valor"
					label="Valor"
					pattern=""
					errorMessage="TODO"
					placeholder="Muitos euros"
					bind:value={formData.email}
				/>
				<Input
					name="data_coleta"
					label="Data da coleta"
					pattern=""
					errorMessage="TODO"
					placeholder="HH:MM"
					bind:value={formData.horario}
				/>
				<Input
					name="local_cobranca"
					label="Local de Cobrança"
					placeholder="Local de Cobrança"
					bind:value={formData.local_cobranca}
				/>
			</div>
			<!-- Right Column -->
			<div>
				<div class="dropdown dropdown-start ">
					<div tabindex="0" role="button" class="btn mb-3 rounded-lg bg-base-100">Metod de pagamento ▼</div>
					<!-- svelte-ignore a11y_no_noninteractive_tabindex -->
					<ul
						tabindex="0"
						class="dropdown-content menu z-1 w-52 p-2 shadow-sm"
					>
						<li><a>Item 1</a></li>
						<li><a>Item 2</a></li>
					</ul>
				</div>
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
			>
				Confirmar
			</button>
		</div>
	</form>
</div>

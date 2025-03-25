<script lang="ts">
	import Input from '$lib/Input.svelte';
	import { goto } from '$app/navigation';

	let payment = $state('Cobra');
	const set_payment = (selected: string) => {
		payment = selected;
	};

	let formData = $state({
		data_ligacao: '',
		valor: '',
		data_coleta: '',
		local_cobranca: '',
		observacoes: ''
	});

	$inspect(payment).with(console.trace);
</script>

<div class="max-w-4xl mx-auto p-6">
	<h2 class="text-5xl font-bold mb-12 text-center">Perfil temporário</h2>
	<form>
		<div class="grid grid-cols-2 gap-x-8 gap-y-4 text-left">
			<div>
				<Input
					name="data"
					label="Data de ligação"
					pattern=""
					errorMessage="TODO"
					placeholder="22/03/91"
                    required={true}
					bind:value={formData.data_ligacao}
				/>
				<Input
					name="valor"
					label="Valor"
					pattern=""
					errorMessage="TODO"
					placeholder="Muitos euros"
					bind:value={formData.valor}
				/>
				<Input
					name="data_coleta"
					label="Data da coleta"
					pattern=""
					errorMessage="TODO"
					placeholder="HH:MM"
					bind:value={formData.data_coleta}
				/>
				<Input
					name="local_cobranca"
					label="Local de Cobrança"
					placeholder="Local de Cobrança"
					bind:value={formData.local_cobranca}
				/>
			</div>
			<div class="dropdown dropdown-start">
				<button tabindex="0" class="btn mb-3 rounded-lg bg-base-100"> Metod de pagamento ⭣</button>
				<ul class="dropdown-content menu z-1 w-52 p-2 shadow-sm bg-base-100">
					<li>
						<button onclick={() => set_payment('cobrador')}>Cobrador</button>
						<button onclick={() => set_payment('multibanco')}>Multibanco</button>
						<button onclick={() => set_payment('transf_banc')}>Transferencia bancaria</button>
						<button onclick={() => set_payment('mbway')}>MBWay</button>
						<button onclick={() => set_payment('vale_ctt')}>Vale CTT/Corretio registado</button>
						<button onclick={() => set_payment('paypal')}>Paypal</button>
						<button onclick={() => set_payment('rsf')}>RSF</button>
						<button onclick={() => set_payment('outros')}>Outros</button>
					</li>
				</ul>
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

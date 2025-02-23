<script lang="ts">
	let {
		placeholder,
		name,
		label,
		required = false,
		pattern = '^\\d{9}$',
		maxlength = 9,
		errorMessage = 'Campo inválido.',
		value = $bindable()
	} = $props();

	let isValid = $state(true);
	$inspect(isValid).with(console.trace);
	$inspect(value).with(console.trace);

	function validate() {
        if (value == '') {
            isValid = true;
        }
		else if (pattern) {
			const regex = new RegExp(pattern);
			isValid = regex.test(value);
		} else {
			isValid = true;
		}
	}
</script>

<div class="flex flex-col mb-3">
	<div class="flex items-center">
		{#if label}
			<label for={name} class="w-1/3 text-gray-700 font-semibold">{label}</label>
		{/if}
		<input
			id={name}
			{placeholder}
			{maxlength}
			bind:value
			{required}
			class="input input-bordered focus:outline-none rounded-lg w-2/3 transition-all duration-150 ease-in-out {isValid
				? ''
				: 'border-red-500 animate-shake'}"
			onblur={validate}
			oninput={validate}
		/>
	</div>

	<div class="w-2/3 ml-auto h-4">
		{#if !isValid}
			<p class="text-red-500 text-xs mt-1">{errorMessage}</p>
		{/if}
	</div>
</div>

<style>
	@keyframes shake {
		0% {
			transform: translateX(0);
		}
		25% {
			transform: translateX(-3px);
		}
		50% {
			transform: translateX(3px);
		}
		75% {
			transform: translateX(-3px);
		}
		100% {
			transform: translateX(0);
		}
	}

	.animate-shake {
		animation: shake 0.2s ease-in-out;
	}
</style>

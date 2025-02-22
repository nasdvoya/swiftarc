<script lang="ts">
	let {
		type,
		placeholder,
		name,
		label,
		value = $bindable(),
		title,
		required,
		pattern,
		maxlength,
		errorMessage
	} = $props();

	let isValid = $state(true);
	function validate() {
		if (!value.trim()) {
			isValid = required!;
			return;
		}
		if (pattern) {
			const regex = new RegExp(pattern);
			isValid = regex.test(value.trim());
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
			{name}
			{type}
			{placeholder}
			{title}
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

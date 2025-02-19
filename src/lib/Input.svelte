<script lang="ts">
    export let type: string = 'text';
    export let placeholder: string = '';
    export let name: string = '';
    export let label: string = '';
    export let value: string = '';
    export let title: string = '';
    export let required: boolean = false;
    export let pattern: string = ''; // Allows custom regex validation
    export let maxlength: number | undefined = undefined;
    export let errorMessage: string = 'Campo inválido!'; // Default error message

    let isValid = true;

    function validate() {
        if (!value.trim()) {
            isValid = !required; // If required, it must not be empty
            return;
        }
        
        if (pattern) {
            const regex = new RegExp(pattern);
            isValid = regex.test(value.trim());
        } else {
            isValid = true; // No pattern means no validation needed
        }
    }
</script>

<div class="flex flex-col mb-3"> <!-- Uniform spacing -->
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
            class="input input-bordered focus:outline-none rounded-lg w-2/3 transition-all duration-150 ease-in-out {isValid ? '' : 'border-red-500 animate-shake'}"
            on:blur={validate}
        />
    </div>

    <!-- Error message BELOW input, aligned properly -->
    <div class="w-2/3 ml-auto h-4">
        {#if !isValid}
        <p class="text-red-500 text-xs mt-1">{errorMessage}</p>
        {/if}
    </div>
</div>

<style>
    @keyframes shake {
        0% { transform: translateX(0); }
        25% { transform: translateX(-3px); }
        50% { transform: translateX(3px); }
        75% { transform: translateX(-3px); }
        100% { transform: translateX(0); }
    }

    .animate-shake {
        animation: shake 0.2s ease-in-out;
    }
</style>

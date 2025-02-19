<script lang="ts">
    export let type: string = 'text';
    export let placeholder: string = '';
    export let name: string = '';
    export let label: string = '';
    export let value: string = '';
    export let title: string = '';
</script>

<div class="flex items-center mb-6">
    {#if label}
    <label for={name} class="w-1/3 text-gray-700 font-semibold">{label}</label>
    {/if}
    <input id={name} {name} {type} {placeholder} {title} bind:value
        class="input input-bordered focus:outline-none rounded-lg w-2/3" />
</div>

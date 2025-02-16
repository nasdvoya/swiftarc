<script>
    export let type = 'text';
    export let placeholder = '';
    export let name = '';
    export let label = '';
</script>

<div class="flex items-center mb-6">
    {#if label}
    <label for={name} class="w-1/3 text-gray-700 font-semibold">{label}</label>
    {/if}
    <input id={name} {name} {type} {placeholder} class="input input-bordered focus:outline-none rounded-lg w-2/3" />
</div>

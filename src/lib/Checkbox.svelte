<script lang="ts">
    export let name: string = '';
    export let label: string = '';
    export let checked: boolean = false; 
</script>

<div class="flex items-center mb-6">
    <label for={name} class="w-1/3 text-gray-700 font-semibold">{label}</label>
    <input id={name} {name} type="checkbox" bind:checked class="checkbox input-bordered rounded-lg w-6 h-6" />
</div>

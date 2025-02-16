<script>
    export let name = '';
    export let label = '';
</script>

<div class="flex items-center mb-6">
    <label for={name} class="w-1/3 text-gray-700 font-semibold">{label}</label>
    <input id={name} name={name} type="checkbox" class="checkbox input-bordered rounded-lg w-6 h-6" />
</div>

<script lang="ts">
	import Nested from '../lib/components/Nested.svelte';
	let name = 'Rick Astley';
	let src = 'https://media.tenor.com/o656qFKDzeUAAAAM/rick-astley-never-gonna-give-you-up.gif';

	// Insert html directly
	let string = `this string contains some <strong>HTML!!!</strong>`;

	// State with runes
	let count = $state(0);
	let numbers = $state([1, 2, 3, 4]);
	function increment() {
		count += 1;
	}
	// Deep state
	function addNumber() {
		numbers.push(numbers.length + 1);
	}
	// Derive state
	let total = $derived(numbers.reduce((t, n) => t + n, 0));
</script>

<h1>Welcome to SvelteKit {name.toUpperCase()}</h1>
<Nested />
<img {src} alt="{name} dances" />
<p>Visit <a href="https://svelte.dev/docs/kit">svelte.dev/docs/kit</a> to read the documentation</p>
<p>{@html string}</p>

<!-- State with runes -->
<button onclick={increment}>
	Clicked {count}
	{count === 1 ? 'time' : 'times'}
</button>
<!-- Deep state with runes -->
<p>{numbers.join(' + ')} = ...</p>
<button onclick={addNumber}> Add a number </button>
<!-- Derive state with runes -->
<p><br /></p>
<p>{numbers.join(' + ')} = {total}</p>
<!-- <button> -->

<style>
	p {
		color: goldenrod;
		font-family: 'Comic Sans MS';
		font-size: 2em;
	}
</style>

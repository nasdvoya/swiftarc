<script lang="ts">
	import '../app.css';
	let { children } = $props();
</script>
<nav>
  <a href="/inspect">Inspect</a>
  <a href="/effect">Effect</a>
  <a href="/universal-reactivity">Universal reactivity</a>
  <a href="/properties">Properties</a>
  <a href="/logic">logic</a>
</nav>

{@render children()}

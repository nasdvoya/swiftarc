<h1 class="text-3xl font-bold underline">Hello world!</h1>
<progress class="progress progress-primary w-56" value="0" max="100"></progress>
<progress class="progress progress-primary w-56" value="10" max="100"></progress>
<progress class="progress progress-primary w-56" value="40" max="100"></progress>
<progress class="progress progress-primary w-56" value="70" max="100"></progress>
<progress class="progress progress-primary w-56" value="100" max="100"></progress>
<style lang="postcss">
    @reference "tailwindcss/theme";

    :global(html) {
        background-color: theme(--color-gray-100);
    }
</style>

<input type="radio" name="radio-2" class="radio radio-xs" checked="checked" />
<input type="radio" name="radio-2" class="radio radio-sm" checked="checked" />
<input type="radio" name="radio-2" class="radio radio-md" checked="checked" />
<input type="radio" name="radio-2" class="radio radio-lg" checked="checked" />
<input type="radio" name="radio-2" class="radio radio-xl" checked="checked" />

<footer class="footer sm:footer-horizontal bg-neutral text-neutral-content p-10">
  <nav>
    <h6 class="footer-title">Services</h6>
    <a class="link link-hover">Branding</a>
    <a class="link link-hover">Design</a>
    <a class="link link-hover">Marketing</a>
    <a class="link link-hover">Advertisement</a>
  </nav>
  <nav>
    <h6 class="footer-title">Company</h6>
    <a class="link link-hover">About us</a>
    <a class="link link-hover">Contact</a>
    <a class="link link-hover">Jobs</a>
    <a class="link link-hover">Press kit</a>
  </nav>
  <nav>
    <h6 class="footer-title">Legal</h6>
    <a class="link link-hover">Terms of use</a>
    <a class="link link-hover">Privacy policy</a>
    <a class="link link-hover">Cookie policy</a>
  </nav>
</footer>

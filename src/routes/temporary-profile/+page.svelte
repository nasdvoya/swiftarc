<script>
    import Input from '$lib/Input.svelte';
    import Checkbox from '$lib/Checkbox.svelte';
</script>

<div class="max-w-4xl mx-auto p-6">
    <h2 class="text-5xl font-bold mb-12 text-center">Perfil temporário</h2>
    <form>
        <div class="grid grid-cols-2 gap-8 text-left">
            <!-- Left Column -->
            <div>
                <Input name="nome" label="Nome" placeholder="John Doe" />
                <Input name="email" label="Email" type="email" placeholder="johndoe@example.com" />
                <Input name="horario" label="Horário" placeholder="HH:MM" />
                <Checkbox name="doador" label="Doador" />
                <Input name="local_cobranca" label="Local de Cobrança" placeholder="Local de Cobrança" />
            </div>
            <!-- Right Column -->
            <div>
                <Input name="morada" label="Morada" placeholder="Morada" />
                <Input name="freguesia" label="Freguesia" placeholder="Freguesia" />
                <Input name="concelho" label="Concelho" placeholder="Concelho" />
                <Input name="codigo_postal" label="C.P." placeholder="Código Postal" />
                <Input name="tel_residencial" label="Tel. Residencial" placeholder="Telefone Residencial" />
                <Input name="tel_trabalho" label="Tel. Trabalho" placeholder="Telefone Trabalho" />
                <Input name="telemovel" label="Telemóvel" placeholder="Telemóvel" />
            </div>

            <!-- Observações (Textarea Spanning Two Columns) -->
            <div class="col-span-2">
                <div class="flex items-center mb-6">
                    <textarea name="observacoes" placeholder="Observações"
                        class="textarea textarea-bordered textarea-lg rounded-lg w-full"></textarea>
                </div>
            </div>

            <!-- Buttons -->
            <button class="btn btn-xs sm:btn-sm md:btn-md lg:btn-lg fixed rounded-full bottom-11 left-10 h-20 mb-14">
                Cancelar
            </button>
            <button type="submit"
                class="btn btn-xs sm:btn-sm md:btn-md lg:btn-lg btn-success fixed rounded-full bottom-11 right-10 h-20 mb-14">
                Criar perfil
            </button>
        </div>
    </form>
</div>

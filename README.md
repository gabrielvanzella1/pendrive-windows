# Pendrive bootável — Windows 11 (pt-BR, 64 bits)

1. Baixe este repositório (botão verde **Code → Download ZIP**) e extraia.
2. Espete um pendrive de **16 GB ou mais** (TUDO nele será apagado).
3. Dê dois cliques em `CRIAR-PENDRIVE.bat`.
   - Na primeira vez ele baixa o Rufus e a ISO oficial da Microsoft (~8 GB). Se cair, rode de novo que continua.
   - Depois abre o Rufus com a ISO já selecionada (aceite a permissão de administrador).
4. Em **Dispositivo**, escolha o pendrive. Clique em **INICIAR**.
5. Na janela **Personalização do Windows**:
   - PC antigo (sem TPM 2.0 / Secure Boot)? Marque *Remover requisito de 4GB+ RAM, Secure Boot e TPM 2.0*.
   - Quer instalar sem conta Microsoft? Marque *Remover requisito de conta Microsoft online*.
6. Espere a barra verde **PRONTO**.

Se a Microsoft recusar o download da ISO, espere uns minutos e rode de novo, ou baixe pelo
[site oficial](https://www.microsoft.com/pt-br/software-download/windows11) e salve como `Win11_ptBR_x64.iso` nesta pasta.

**Boot pelo pendrive:** ligue o PC apertando a tecla do menu de boot
(Dell F12, Lenovo F12, HP F9, Acer F12, Asus F8/Esc, Positivo F12/F7) e escolha o pendrive.

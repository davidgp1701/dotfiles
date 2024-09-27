{ pkgs,...}:

{
  # Nvim-Surround
  programs.nixvim.extraPlugins = [
    ( pkgs.vimUtils.buildVimPlugin {
      name = "cyclest";
      src = pkgs.fetchFromGitHub {
          owner = "tjdevries";
          repo = "cyclist.vim";
          rev = "d611ea3a21365f90d512dd024874e070e864309e";
          hash = "sha256-CpfY2luD59p4FM9cvGsn6pyEFMAUv1vi2+WL27e6Pjk=";
        };
    })
  ];

  programs.nixvim.extraConfigVim = ''
      call cyclist#add_listchar_option_set('limited', {
        \ 'eol': '↲',
        \ 'tab': '» ',
        \ 'trail': '·',
        \ 'extends': '<',
        \ 'precedes': '>',
        \ 'conceal': '┊',
        \ 'nbsp': '␣',
        \ })

      call cyclist#add_listchar_option_set('default', {
        \ 'eol': '↲',
        \ 'tab': '»·',
        \ 'space': '·',
        \ 'trail': '-',
        \ 'extends': '☛',
        \ 'precedes': '☚',
        \ 'conceal': '┊',
        \ 'nbsp': '☠',
        \ })

      call cyclist#activate_listchars('default')
  '';
}

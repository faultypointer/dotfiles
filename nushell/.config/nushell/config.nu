load-env {
    "EDITOR": "nvim"
}

$env.config.buffer_editor = "nvim"
$env.config.completions.algorithm = "fuzzy"
$env.config.completions.case_sensitive = false
$env.config.completions.external.enable = true
$env.config.completions.external.max_results = 100
$env.config.completions.partial = true
$env.config.completions.quick = true
$env.config.cursor_shape.emacs = "line"
$env.config.cursor_shape.vi_insert = "block"
$env.config.cursor_shape.vi_normal = "underscore"
$env.config.edit_mode = "vi"
$env.config.ls.clickable_links = true
$env.config.show_banner = false


source ~/.cache/carapace/init.nu

alias "cat" = bat
alias "eza" = eza --hyperlink --group-directories-first --icons --tree '--color=always' '--level=1'
alias "find" = fd
alias "grep" = rg
alias "nivm" = nvim
alias "rm" = trash
alias "vim" = nvim
alias "vnim" = nvim

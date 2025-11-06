{
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    lsp = {
      enable = true;
      servers = {
        asm_lsp.enable = true;
        bashls.enable = true;
        gopls.enable = true;
        harper_ls = {
          enable = true;
          settings = {
            userDictPath = "";
            workspaceDictPath = "";
            fileDictPath = "";
            linters = {
              SpellCheck = true;
              SpelledNumbers = false;
              AnA = true;
              SentenceCapitalization = true;
              UnclosedQuotes = true;
              WrongQuotes = false;
              LongSentences = true;
              RepeatedWords = true;
              Spaces = true;
              Matcher = true;
              CorrectNumberSuffix = true;
            };
            codeActions = { ForceStable = false; };
            markdown = { IgnoreLinkTitle = false; };
            diagnosticSeverity = "hint";
            isolateEnglish = false;
            dialect = "American";
            maxFileLength = 120000;
            ignoredLintsPath = "";
            excludePatterns = { };
          };
        };
        ts_ls.enable = true;
        nixd.enable = true;
        tailwindcss.enable = true;
        html.enable = true;
        svelte.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          golangci_lint.enable = true;
          statix.enable = true;
        };
        formatting = {
          gofmt.enable = true;
          goimports.enable = true;
          nixfmt.enable = true;
          markdownlint.enable = true;
          tidy.enable = true;
          shellharden.enable = true;
          shfmt.enable = true;
          golines.enable = true;
          gofumpt.enable = true;
        };
      };
    };
  };
}

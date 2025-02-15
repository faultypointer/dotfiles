{ variables, ...}:
{
    programs.thunderbird = {
      enable = true;
      profiles = {
        default = {
          isDefault = true;
        };
      };
    };
}

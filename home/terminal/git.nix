{ variables, ... }:{
  programs.git = {
    enable = true;
    userName = variables.username;
    userEmail = variables.email;
  };
}

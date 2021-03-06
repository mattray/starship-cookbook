name 'starship'

default_source :supermarket

run_list 'starship::default'

cookbook 'starship', path: '.'

default['starship']['user']['root']['config'] = {
  "add_newline"=>false,
  "character"=>{"symbol"=>"$", "use_symbol_for_status"=>true, "error_symbol"=>"✗$", "style_success"=>"green", "style_failure"=>"red"},
  "aws"=>{"disabled"=>true},
  "cmd_duration"=>{"style"=>"cyan", "min_time"=>5000, "prefix"=>"time:"},
  "directory"=>{"style"=>"blue", "truncate_to_repo"=>false, "truncation_length"=>10, "prefix"=>"", "suffix"=>""},
  "git_branch"=>{"style"=>"green", "symbol"=>":", "prefix"=>"", "suffix"=>""},
  "git_status"=>
    {"style"=>"green", "ahead"=>"⇡", "behind"=>"⇣", "conflicted"=>"≠", "deleted"=>"✖", "diverged"=>"⇕", "modified"=>"Δ", "renamed"=>"»", "staged"=>"+", "stashed"=>"$", "untracked"=>"?", "show_sync_count"=>true},
  "hostname"=>{"style"=>"yellow", "ssh_only"=>true},
  "jobs"=>{"style"=>"black", "symbol"=>"✦", "threshold"=>1},
  "ruby"=>{"prefix"=>"", "suffix"=>"", "style"=>"red", "symbol"=>"ℜ:"},
  "terraform"=>{"prefix"=>"", "suffix"=>"", "style"=>"purple", "symbol"=>"Τ:"},
  "username"=>{"prefix"=>"", "suffix"=>"", "style_user"=>"white", "style_root"=>"red", "show_always"=>false, "disabled"=>false}
}

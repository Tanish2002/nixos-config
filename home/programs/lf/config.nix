{ pkgs, ... }:
let
  lf_cleaner = pkgs.writeShellScriptBin "lf_cleaner" ''
    if [ -n "$FIFO_UEBERZUG" ]; then
    	printf '{"action": "remove", "identifier": "PREVIEW"}\n' > "$FIFO_UEBERZUG"
    fi
  '';
in {
  programs.lf = {
    previewer.source = "${pkgs.scripts}/bin/lf_preview.sh";
    extraConfig = ''
      set cleaner ${lf_cleaner}/bin/lf_cleaner
    '';
    settings = {
      icons = true;
      preview = true;
      hidden = true;
    };
    keybindings = {
      "d" = null;
      "dD" = "delete";
      "dd" = "cut";
      "y" = null;
      "yy" = "copy";
      "yd" = "yank-dirname";
      "yn" = "yank-basename";
      "y." = "yank-basename-without-extension";
      "yp" = "yank-path";
      "p" = null;
      "pp" = "paste-async";
      "s" = "shell";
    };
    commands = {
      "paste-async" = ''
            &{{
            set -- $(cat ~/.local/share/lf/files)
            mode="$1"
            shift
            case "$mode" in
                copy)
                    rsync -av --ignore-existing --progress -- "$@" . |
                    stdbuf -i0 -o0 -e0 tr '\r' '\n' |
                    while IFS= read -r line; do
                        lf -remote "send $id echo $line"
                    done
                    ;;
                move) mv -n -- "$@" .;;
            esac
            rm ~/.local/share/lf/files
            lf -remote "send load"
            lf -remote "send clear"
        }}
      '';

      "yank-dirname" =
        ''$dirname -- "$f" | head -c-1 | xclip -i -selection clipboard'';

      "yank-path" = ''$printf '%s' "$fx" | xclip -i -selection clipboard'';

      "yank-basename" =
        ''$basename -a -- "$fx" | head -c-1 | xclip -i -selection clipboard'';

      "yank-basename-without-extension" = ''
        ''${{
            echo "$fx" |
              xargs -r -d '\n' basename -a |
              awk -e '{
                for (i=length($0); i > 0; i--) {
                  if (substr($0, i, 1) == ".") {
                    if (i == 1) print $0
                    else print substr($0, 0, i-1
                    break
                  }
                
                if (i == 0)
                  print $0
              }' |
              if [ -n "$fs" ]; then cat; else tr -d '\n'; fi |
              xclip -i -selection clipboard
        }}
      '';
      "open" = ''
        ''${{
            case $(${pkgs.file}/bin/file --mime-type "$f" -bL) in
                text/*|application/json) $EDITOR "$f";;
                application/pdf) ${pkgs.zathura}/bin/zathura "$f";;
                *) xdg-open "$f" ;;
            esac
        }}'';
    };
  };

  xdg.configFile = {
    colors = {
      text = ''
        # vim:ft=dircolors
        # (This is not a dircolors file but it helps to highlight colors and comments)

        # default values from dircolors
        # (entries with a leading # are not implemented in lf)
        # #no     00              # NORMAL
        # fi      00              # FILE
        # #rs     0               # RESET
        # di      01;34           # DIR
        # ln      01;36           # LINK
        # #mh     00              # MULTIHARDLINK
        # pi      40;33           # FIFO
        # so      01;35           # SOCK
        # #do     01;35           # DOOR
        # bd      40;33;01        # BLK
        # cd      40;33;01        # CHR
        # or      40;31;01        # ORPHAN
        # #mi     00              # MISSING
        # su      37;41           # SETUID
        # sg      30;43           # SETGID
        # #ca     30;41           # CAPABILITY
        # tw      30;42           # STICKY_OTHER_WRITABLE
        # ow      34;42           # OTHER_WRITABLE
        # st      37;44           # STICKY
        # ex      01;32           # EXEC

        # default values from lf (with matching order)
        # ln      01;36   # LINK
        # or      31;01   # ORPHAN
        # tw      01;34   # STICKY_OTHER_WRITABLE
        # ow      01;34   # OTHER_WRITABLE
        # st      01;34   # STICKY
        # di      01;34   # DIR
        # pi      33      # FIFO
        # so      01;35   # SOCK
        # bd      33;01   # BLK
        # cd      33;01   # CHR
        # su      01;32   # SETUID
        # sg      01;32   # SETGID
        # ex      01;32   # EXEC
        # fi      00      # FILE

        # file types (with matching order)
        ln      01;36   # LINK
        or      31;01   # ORPHAN
        tw      34      # STICKY_OTHER_WRITABLE
        ow      34      # OTHER_WRITABLE
        st      01;34   # STICKY
        di      01;34   # DIR
        pi      33      # FIFO
        so      01;35   # SOCK
        bd      33;01   # BLK
        cd      33;01   # CHR
        su      01;32   # SETUID
        sg      01;32   # SETGID
        ex      01;32   # EXEC
        fi      00      # FILE

        # archives or compressed (dircolors defaults)
        *.tar   01;31
        *.tgz   01;31
        *.arc   01;31
        *.arj   01;31
        *.taz   01;31
        *.lha   01;31
        *.lz4   01;31
        *.lzh   01;31
        *.lzma  01;31
        *.tlz   01;31
        *.txz   01;31
        *.tzo   01;31
        *.t7z   01;31
        *.zip   01;31
        *.z     01;31
        *.dz    01;31
        *.gz    01;31
        *.lrz   01;31
        *.lz    01;31
        *.lzo   01;31
        *.xz    01;31
        *.zst   01;31
        *.tzst  01;31
        *.bz2   01;31
        *.bz    01;31
        *.tbz   01;31
        *.tbz2  01;31
        *.tz    01;31
        *.deb   01;31
        *.rpm   01;31
        *.jar   01;31
        *.war   01;31
        *.ear   01;31
        *.sar   01;31
        *.rar   01;31
        *.alz   01;31
        *.ace   01;31
        *.zoo   01;31
        *.cpio  01;31
        *.7z    01;31
        *.rz    01;31
        *.cab   01;31
        *.wim   01;31
        *.swm   01;31
        *.dwm   01;31
        *.esd   01;31

        # image formats (dircolors defaults)
        *.jpg   01;35
        *.jpeg  01;35
        *.mjpg  01;35
        *.mjpeg 01;35
        *.gif   01;35
        *.bmp   01;35
        *.pbm   01;35
        *.pgm   01;35
        *.ppm   01;35
        *.tga   01;35
        *.xbm   01;35
        *.xpm   01;35
        *.tif   01;35
        *.tiff  01;35
        *.png   01;35
        *.svg   01;35
        *.svgz  01;35
        *.mng   01;35
        *.pcx   01;35
        *.mov   01;35
        *.mpg   01;35
        *.mpeg  01;35
        *.m2v   01;35
        *.mkv   01;35
        *.webm  01;35
        *.ogm   01;35
        *.mp4   01;35
        *.m4v   01;35
        *.mp4v  01;35
        *.vob   01;35
        *.qt    01;35
        *.nuv   01;35
        *.wmv   01;35
        *.asf   01;35
        *.rm    01;35
        *.rmvb  01;35
        *.flc   01;35
        *.avi   01;35
        *.fli   01;35
        *.flv   01;35
        *.gl    01;35
        *.dl    01;35
        *.xcf   01;35
        *.xwd   01;35
        *.yuv   01;35
        *.cgm   01;35
        *.emf   01;35
        *.ogv   01;35
        *.ogx   01;35

        # audio formats (dircolors defaults)
        *.aac   00;36
        *.au    00;36
        *.flac  00;36
        *.m4a   00;36
        *.mid   00;36
        *.midi  00;36
        *.mka   00;36
        *.mp3   00;36
        *.mpc   00;36
        *.ogg   00;36
        *.ra    00;36
        *.wav   00;36
        *.oga   00;36
        *.opus  00;36
        *.spx   00;36
        *.xspf  00;36
      '';
      target = "lf/colors";
    };
    icons = {
      text = ''
        # vim:ft=conf

        # These examples require Nerd Fonts or a compatible font to be used.
        # See https://www.nerdfonts.com for more information.

        # default values from lf (with matching order)
        # ln      l       # LINK
        # or      l       # ORPHAN
        # tw      t       # STICKY_OTHER_WRITABLE
        # ow      d       # OTHER_WRITABLE
        # st      t       # STICKY
        # di      d       # DIR
        # pi      p       # FIFO
        # so      s       # SOCK
        # bd      b       # BLK
        # cd      c       # CHR
        # su      u       # SETUID
        # sg      g       # SETGID
        # ex      x       # EXEC
        # fi      -       # FILE

        # file types (with matching order)
        ln             # LINK
        or             # ORPHAN
        tw      t       # STICKY_OTHER_WRITABLE
        ow             # OTHER_WRITABLE
        st      t       # STICKY
        di             # DIR
        pi      p       # FIFO
        so      s       # SOCK
        bd      b       # BLK
        cd      c       # CHR
        su      u       # SETUID
        sg      g       # SETGID
        ex             # EXEC
        fi             # FILE

        # file extensions (vim-devicons)
        *.styl          
        *.sass          
        *.scss          
        *.htm           
        *.html          
        *.slim          
        *.haml          
        *.ejs           
        *.css           
        *.less          
        *.md            
        *.mdx           
        *.markdown      
        *.rmd           
        *.json          
        *.webmanifest   
        *.js            
        *.mjs           
        *.jsx           
        *.rb            
        *.gemspec       
        *.rake          
        *.php           
        *.py            
        *.pyc           
        *.pyo           
        *.pyd           
        *.coffee        
        *.mustache      
        *.hbs           
        *.conf          
        *.ini           
        *.yml           
        *.yaml          
        *.toml          
        *.bat           
        *.mk            
        *.jpg           
        *.jpeg          
        *.bmp           
        *.png           
        *.webp          
        *.gif           
        *.ico           
        *.twig          
        *.cpp           
        *.c++           
        *.cxx           
        *.cc            
        *.cp            
        *.c             
        *.cs            
        *.h             
        *.hh            
        *.hpp           
        *.hxx           
        *.hs            
        *.lhs           
        *.nix           
        *.lua           
        *.java          
        *.sh            
        *.fish          
        *.bash          
        *.zsh           
        *.ksh           
        *.csh           
        *.awk           
        *.ps1           
        *.ml            λ
        *.mli           λ
        *.diff          
        *.db            
        *.sql           
        *.dump          
        *.clj           
        *.cljc          
        *.cljs          
        *.edn           
        *.scala         
        *.go            
        *.dart          
        *.xul           
        *.sln           
        *.suo           
        *.pl            
        *.pm            
        *.t             
        *.rss           
        '*.f#'          
        *.fsscript      
        *.fsx           
        *.fs            
        *.fsi           
        *.rs            
        *.rlib          
        *.d             
        *.erl           
        *.hrl           
        *.ex            
        *.exs           
        *.eex           
        *.leex          
        *.heex          
        *.vim           
        *.ai            
        *.psd           
        *.psb           
        *.ts            
        *.tsx           
        *.jl            
        *.pp            
        *.vue           
        *.elm           
        *.swift         
        *.xcplayground  
        *.tex           ﭨ
        *.r             ﳒ
        *.rproj         鉶
        *.sol           ﲹ
        *.pem           

        # file names (vim-devicons) (case-insensitive not supported in lf)
        *gruntfile.coffee       
        *gruntfile.js           
        *gruntfile.ls           
        *gulpfile.coffee        
        *gulpfile.js            
        *gulpfile.ls            
        *mix.lock               
        *dropbox                
        *.ds_store              
        *.gitconfig             
        *.gitignore             
        *.gitattributes         
        *.gitlab-ci.yml         
        *.bashrc                
        *.zshrc                 
        *.zshenv                
        *.zprofile              
        *.vimrc                 
        *.gvimrc                
        *_vimrc                 
        *_gvimrc                
        *.bashprofile           
        *favicon.ico            
        *license                
        *node_modules           
        *react.jsx              
        *procfile               
        *dockerfile             
        *docker-compose.yml     
        *rakefile               
        *config.ru              
        *gemfile                
        *makefile               
        *cmakelists.txt         
        *robots.txt             ﮧ

        # file names (case-sensitive adaptations)
        *Gruntfile.coffee       
        *Gruntfile.js           
        *Gruntfile.ls           
        *Gulpfile.coffee        
        *Gulpfile.js            
        *Gulpfile.ls            
        *Dropbox                
        *.DS_Store              
        *LICENSE                
        *React.jsx              
        *Procfile               
        *Dockerfile             
        *Docker-compose.yml     
        *Rakefile               
        *Gemfile                
        *Makefile               
        *CMakeLists.txt         

        # file patterns (vim-devicons) (patterns not supported in lf)
        # .*jquery.*\.js$         
        # .*angular.*\.js$        
        # .*backbone.*\.js$       
        # .*require.*\.js$        
        # .*materialize.*\.js$    
        # .*materialize.*\.css$   
        # .*mootools.*\.js$       
        # .*vimrc.*               
        # Vagrantfile$            

        # file patterns (file name adaptations)
        *jquery.min.js          
        *angular.min.js         
        *backbone.min.js        
        *require.min.js         
        *materialize.min.js     
        *materialize.min.css    
        *mootools.min.js        
        *vimrc                  
        Vagrantfile             

        # archives or compressed (extensions from dircolors defaults)
        *.tar   
        *.tgz   
        *.arc   
        *.arj   
        *.taz   
        *.lha   
        *.lz4   
        *.lzh   
        *.lzma  
        *.tlz   
        *.txz   
        *.tzo   
        *.t7z   
        *.zip   
        *.z     
        *.dz    
        *.gz    
        *.lrz   
        *.lz    
        *.lzo   
        *.xz    
        *.zst   
        *.tzst  
        *.bz2   
        *.bz    
        *.tbz   
        *.tbz2  
        *.tz    
        *.deb   
        *.rpm   
        *.jar   
        *.war   
        *.ear   
        *.sar   
        *.rar   
        *.alz   
        *.ace   
        *.zoo   
        *.cpio  
        *.7z    
        *.rz    
        *.cab   
        *.wim   
        *.swm   
        *.dwm   
        *.esd   

        # image formats (extensions from dircolors defaults)
        *.jpg   
        *.jpeg  
        *.mjpg  
        *.mjpeg 
        *.gif   
        *.bmp   
        *.pbm   
        *.pgm   
        *.ppm   
        *.tga   
        *.xbm   
        *.xpm   
        *.tif   
        *.tiff  
        *.png   
        *.svg   
        *.svgz  
        *.mng   
        *.pcx   
        *.mov   
        *.mpg   
        *.mpeg  
        *.m2v   
        *.mkv   
        *.webm  
        *.ogm   
        *.mp4   
        *.m4v   
        *.mp4v  
        *.vob   
        *.qt    
        *.nuv   
        *.wmv   
        *.asf   
        *.rm    
        *.rmvb  
        *.flc   
        *.avi   
        *.fli   
        *.flv   
        *.gl    
        *.dl    
        *.xcf   
        *.xwd   
        *.yuv   
        *.cgm   
        *.emf   
        *.ogv   
        *.ogx   

        # audio formats (extensions from dircolors defaults)
        *.aac   
        *.au    
        *.flac  
        *.m4a   
        *.mid   
        *.midi  
        *.mka   
        *.mp3   
        *.mpc   
        *.ogg   
        *.ra    
        *.wav   
        *.oga   
        *.opus  
        *.spx   
        *.xspf  

        # other formats
        *.pdf   


        # Yoinked from ranger devicons(https://github.com/alexanderjeurissen/ranger_devicons/blob/main/devicons.py)
        '*.7z'        
        '*.a'         
        '*.ai'        
        '*.apk'       
        '*.asm'       
        '*.asp'       
        '*.aup'       
        '*.avi'       
        '*.awk'       
        '*.bash'      
        '*.bat'       
        '*.bmp'       
        '*.bz2'       
        '*.c'         
        '*.c++'       
        '*.cab'       
        '*.cbr'       
        '*.cbz'       
        '*.cc'        
        '*.class'     
        '*.clj'       
        '*.cljc'      
        '*.cljs'      
        '*.cmake'     
        '*.coffee'    
        '*.conf'      
        '*.cp'        
        '*.cpio'      
        '*.cpp'       
        '*.cs'        
        '*.csh'       
        '*.css'       
        '*.cue'       
        '*.cvs'       
        '*.cxx'       
        '*.d'         
        '*.dart'      
        '*.db'        
        '*.deb'       
        '*.diff'      
        '*.dll'       
        '*.wps'       
        '*.wpt'       
        '*.doc'       
        '*.docx'      
        '*.docm'      
        '*.dotx'      
        '*.dotm'      
        '*.dump'      
        '*.edn'       
        '*.eex'       
        '*.efi'       
        '*.ejs'       
        '*.elf'       
        '*.elm'       
        '*.epub'      
        '*.erl'       
        '*.ex'        
        '*.exe'       
        '*.exs'       
        '*.f#'        
        '*.fifo'      ﳣ
        '*.fish'      
        '*.flac'      
        '*.flv'       
        '*.fs'        
        '*.fsi'       
        '*.fsscript'  
        '*.fsx'       
        '*.gem'       
        '*.gemspec'   
        '*.gif'       
        '*.go'        
        '*.gz'        
        '*.gzip'      
        '*.h'         
        '*.haml'      
        '*.hbs'       
        '*.hh'        
        '*.hpp'       
        '*.hrl'       
        '*.hs'        
        '*.htaccess'  
        '*.htm'       
        '*.html'      
        '*.htpasswd'  
        '*.hxx'       
        '*.ico'       
        '*.img'       
        '*.ini'       
        '*.iso'       
        '*.jar'       
        '*.java'      
        '*.jl'        
        '*.jpeg'      
        '*.jpg'       
        '*.js'        
        '*.json'      
        '*.jsx'       
        '*.key'       
        '*.ksh'       
        '*.leex'      
        '*.less'      
        '*.lha'       
        '*.lhs'       
        '*.log'       
        '*.lua'       
        '*.lzh'       
        '*.lzma'      
        '*.m4a'       
        '*.m4v'       
        '*.markdown'  
        '*.md'        
        '*.mdx'       
        '*.mjs'       
        '*.mkv'       
        '*.ml'        λ
        '*.mli'       λ
        '*.mov'       
        '*.mp3'       
        '*.mp4'       
        '*.mpeg'      
        '*.mpg'       
        '*.msi'       
        '*.mustache'  
        '*.nix'       
        '*.o'         
        '*.ogg'       
        '*.part'      
        '*.pdf'       
        '*.php'       
        '*.pl'        
        '*.pm'        
        '*.png'       
        '*.pp'        
        '*.dps'       
        '*.dpt'       
        '*.ppt'       
        '*.pptx'      
        '*.pptm'      
        '*.pot'       
        '*.potx'      
        '*.potm'      
        '*.pps'       
        '*.ppsx'      
        '*.ppsm'      
        '*.ps1'       
        '*.psb'       
        '*.psd'       
        '*.pub'       
        '*.py'        
        '*.pyc'       
        '*.pyd'       
        '*.pyo'       
        '*.r'         ﳒ
        '*.rake'      
        '*.rar'       
        '*.rb'        
        '*.rc'        
        '*.rlib'      
        '*.rmd'       
        '*.rom'       
        '*.rpm'       
        '*.rproj'     鉶
        '*.rs'        
        '*.rss'       
        '*.rtf'       
        '*.s'         
        '*.sass'      
        '*.scala'     
        '*.scss'      
        '*.sh'        
        '*.slim'      
        '*.sln'       
        '*.so'        
        '*.sql'       
        '*.styl'      
        '*.suo'       
        '*.swift'     
        '*.t'         
        '*.tar'       
        '*.tex'       ﭨ
        '*.tgz'       
        '*.toml'      
        '*.torrent'   
        '*.ts'        
        '*.tsx'       
        '*.twig'      
        '*.vim'       
        '*.vimrc'     
        '*.vue'       ﵂
        '*.wav'       
        '*.webm'      
        '*.webmanifest'  
        '*.webp'      
        '*.xbps'      
        '*.xcplayground'  
        '*.xhtml'     
        '*.et'        
        '*.ett'       
        '*.xls'       
        '*.xlt'       
        '*.xlsx'      
        '*.xlsm'      
        '*.xlsb'      
        '*.xltx'      
        '*.xltm'      
        '*.xla'       
        '*.xlam'      
        '*.xml'       
        '*.xul'       
        '*.xz'        
        '*.yaml'      
        '*.yml'       
        '*.zip'       
        '.git/'                              
        'Desktop/'                           
        'Documents/'                         
        'Downloads/'                         
        'Dotfiles/'                          
        'Dropbox/'                           
        'Music/'                             
        'Pictures/'                          
        'Public/'                            
        'Templates/'                         
        'Videos/'                            
        'anaconda3/'                         
        'go/'                                
        'workspace/'                         
        'OneDrive/'                          

        '*.bash_aliases'                     
        '*.bash_history'                     
        '*.bash_logout'                      
        '*.bash_profile'                     
        '*.bashprofile'                      
        '*.bashrc'                           
        '*.dmrc'                             
        '*.DS_Store'                         
        '*.fasd'                             
        '*.fehbg'                            
        '*.gitattributes'                    
        '*.gitconfig'                        
        '*.gitignore'                        
        '*.gitlab-ci.yml'                    
        '*.gvimrc'                           
        '*.inputrc'                          
        '*.jack-settings'                    
        '*.mime.types'                       
        '*.ncmpcpp'                          
        '*.nvidia-settings-rc'               
        '*.pam_environment'                  
        '*.profile'                          
        '*.recently-used'                    
        '*.selected_editor'                  
        '*.vim'                              
        '*.viminfo'                          
        '*.vimrc'                            
        '*.Xauthority'                       
        '*.Xdefaults'                        
        '*.xinitrc'                          
        '*.xinputrc'                         
        '*.Xresources'                       
        '*.zshrc'                            
        '*_gvimrc'                           
        '*_vimrc'                            
        '*a.out'                             
        '*authorized_keys'                   
        '*bspwmrc'                           
        '*cmakelists.txt'                    
        '*config'                            
        '*config.ac'                         
        '*config.m4'                         
        '*config.mk'                         
        '*config.ru'                         
        '*configure'                         
        '*docker-compose.yml'                
        '*dockerfile'                        
        '*Dockerfile'                        
        '*dropbox'                           
        '*exact-match-case-sensitive-1.txt'  X1
        '*exact-match-case-sensitive-2'      X2
        '*favicon.ico'                       
        '*gemfile'                           
        '*gruntfile.coffee'                  
        '*gruntfile.js'                      
        '*gruntfile.ls'                      
        '*gulpfile.coffee'                   
        '*gulpfile.js'                       
        '*gulpfile.ls'                       
        '*ini'                               
        '*known_hosts'                       
        '*ledger'                            
        '*license'                           
        '*LICENSE'                           
        '*LICENSE.md'                        
        '*LICENSE.txt'                       
        '*Makefile'                          
        '*makefile'                          
        '*Makefile.ac'                       
        '*Makefile.in'                       
        '*mimeapps.list'                     
        '*mix.lock'                          
        '*node_modules'                      
        '*package-lock.json'                 
        '*package.json'                      
        '*playlists'                         
        '*procfile'                          
        '*Rakefile'                          
        '*rakefile'                          
        '*react.jsx'                         
        '*README'                            
        '*README.markdown'                   
        '*README.md'                         
        '*README.rst'                        
        '*README.txt'                        
        '*sxhkdrc'                           
        '*user-dirs.dirs'                    

      '';
      target = "lf/icons";
    };
  };
}

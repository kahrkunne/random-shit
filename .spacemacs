;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(csv
     yaml
     javascript
     html
     auto-completion
     syntax-checking
     python
     ivy
     emacs-lisp
     common-lisp
     git
     org
     (version-control
      :variables
      version-control-diff-tool 'git-gutter+
      version-control-diff-side 'left)
     erc
     haskell
     ipython-notebook
     latex
     cscope
     gtags
     docker
     finance
     nginx
     systemd
     (shell
      :variables
      shell-default-term-shell "/usr/bin/xonsh")
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      web-mode
                                      vue-mode
                                      key-chord
                                      rainbow-mode
                                      alert
                                      (xelb
                                       :location (recipe :fetcher github :repo "ch11ng/xelb"))
                                      (exwm
                                       :location (recipe :fetcher github :repo "ch11ng/exwm"))
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(base16-darktooth
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("xos4 Terminus"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.5)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   dotspacemacs-mode-line-theme '(spacemacs :separator nil)

   dotspacemacs-mode-line-unicode-symbols nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun setup-exwm ()
  (require 'exwm)
  (require 'exwm-config)
  (setq exwm-input--line-mode-passthrough t)

  ;; Pull up the buffer list
  (spacemacs/set-leader-keys "b l" 'list-buffers)

  ;; Set the initial workspace number.
  (setq exwm-workspace-number 10)
  ;; Make class name the buffer name
  (add-hook 'exwm-update-class-hook
            (lambda ()
              (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                          (string= "gimp" exwm-instance-name))
                (exwm-workspace-rename-buffer exwm-class-name))))
  (add-hook 'exwm-update-title-hook
            (lambda ()
              (when (or (not exwm-instance-name)
                        (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
                (exwm-workspace-rename-buffer exwm-title))))
  ;; Keybindings
  (exwm-input-set-key (kbd "s-x") #'exwm-reset)
  (exwm-input-set-key (kbd "s-w") #'exwm-workspace-switch)
  (dotimes (i 10)
    (exwm-input-set-key (kbd (format "s-%d" i))
                        `(lambda ()
                           (interactive)
                           (exwm-workspace-switch ,i)))) 
  (exwm-input-set-key (kbd "s-r") 'exwm-kahr/launcher)
  (exwm-input-set-key (kbd "s-t") 'exwmx-toggle-keyboard)
  ;; Start EXWM
  (require 'exwm-randr)
  (setq exwm-randr-workspace-output-plist '(0 "HDMI-0" 1 "DVI-D-1" 2 "DVI-D-1" 3 "DVI-D-1" 4 "DVI-D-1" 5 "DVI-D-1" 6 "HDMI-0" 7 "HDMI-0" 8 "HDMI-0" 9 "HDMI-0"))
  (add-hook 'exwm-randr-screen-change-hook
            (lambda ()
              (start-process-shell-command
               "xrandr" nil "xrandr --output HDMI-0 --right-of DVI-D-0 --auto")))

  (setq exwm-workspace-show-all-buffers t)
  (setq exwm-layout-show-all-buffers t)
  (exwm-enable)
  (exwm-randr-enable)
  (setenv "DISPLAY" ":0")
  )

(defun setup-settings ()
  (setq user-full-name "KahrKunne"
        user-mail-address "kahr.kunne@gmail.com"
        backup-directory-alist '(("~/.emacs.d/backups"))
        delete-old-versions nil
        version-control t
        vc-make-backup-files t
        auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list" t))
        savehist-file "~/.emacs.d/savehist"
        require-final-newline t
        global-auto-revert-mode t
        global-auto-revert-non-file-buffers t
        auto-revert-verbose nil
        custom-safe-themes t
        )
  (add-hook 'term-mode-hook 'toggle-truncate-lines)
  (fset 'yes-or-no-p 'y-or-n-p)
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  )

(defun setup-keybindings ()
  (global-set-key (kbd "C-x o") #'ace-window)
  
  (defhydra hydra-zoom (global-map "<f2>")
    "zoom"
    ("g" text-scale-increase "in")
    ("l" text-scale-decrease "out"))

  (defhydra hydra-launch (:color blue :hint nil)
    "
    ^Term^             ^Files^           ^IRC^          ^Email^        ^System        
    ^^^^^^^^--------------------------------------------------------------------------
    _t_: ansi-term     _d_: dired        _i_: erc       _g_: gnus      _l_: linux app
    _e_: eshell
    _s_: shell
    "
    ("t" (lambda () (interactive) (ansi-term "xonsh")))
    ("e" eshell)
    ("s" shell)
    ("d" dired)
    ("i" erc)
    ("g" gnus)
    ("l" counsel-linux-app))
  (global-set-key (kbd "C-c l") 'hydra-launch/body)

  (defhydra hydra-navigate (:color blue :hint nil)
    "
    ^Char^             ^Line^           ^search^          ^File^          ^buffer
    ^^^^^^^^---------------------------------------------------------------------------------------
    _c_: char timer    _l_: line        _s_: search       _f_: find-file  _b_ buffer
    _j_: char                         _a_: search all   _p_: ffap       _o_ buffer other window
    "
    ("c" avy-goto-char-timer)
    ("j" avy-goto-char)
    ("l" avy-goto-line)
    ("s" swiper)
    ("a" swiper-all)
    ("f" counsel-find-file)
    ("p" counsel-find-file-at-point)
    ("b" switch-to-buffer)
    ("o" switch-to-buffer-other-window))
  (global-set-key (kbd "C-c n") 'hydra-navigate/body)

  (defun eshell-full-clear ()
    (interactive)
    (eshell/clear t))

  (defhydra hydra-eshell (:color blue :hint nil)
    "
    ^I/O^              ^Visual
    ^^^^^^^-----------------------------
    _b_: buffer        _c_: clear
         _x_: clear history
    "
    ("b" eshell-insert-buffer-name)
    ("c" eshell/clear)
    ("x" eshell-full-clear))
                                        ;  (global-set-key (kbd "C-c e") 'hydra-eshell/body)

  (defhydra hydra-crux (:color blue :hint nil)
    "
    _o_: open    _a_: nl a    _b_: nl b    _e_: e.a.r.    _D_: d.f.a.b.
    "
    ("o" crux-open-with)
    ("a" crux-smart-open-line-above)
    ("b" crux-smart-open-line)
    ("e" crux-eval-and-replace)
    ("D" crux-delte-file-and-buffer))
  (global-set-key (kbd "C-c c") #'hydra-crux/body)

  (defhydra hydra-dumb-jump (:color blue :hint nil)
    "
    _g_: go    _b_: back    _p_: prompt
  "
    ("g" dumb-jump-go)
    ("b" dumb-jump-back)
    ("p" dumb-jump-go-prompt))
  (global-set-key (kbd "C-c j") #'hydra-dumb-jump/body)

  (global-set-key (kbd "C-c d") 'insert-date)
  (global-set-key (kbd "C-x g") 'webjump)
  (global-set-key (kbd "C-c b") 'paste-below)
  (global-set-key (kbd "C-c a") 'paste-above)
  (global-set-key (kbd "C-c m") 'magit-status)
  (global-set-key (kbd "C-c f") 'eval-region)
  (global-set-key (kbd "C-x C-r") 'sudo-edit)
  (global-set-key (kbd "C-c r") 'rename-buffer)
  (global-set-key (kbd "C-h C-f") 'find-function)
  (global-set-key (kbd "C-h C-v") 'find-variable)
  (global-set-key (kbd "C-c p") #'mingus-toggle)
  (global-set-key (kbd "<XF86AudioLowerVolume>") #'mingus-vol-down)
  (global-set-key (kbd "<XF86AudioRaiseVolume>") #'mingus-vol-up)
  (global-set-key (kbd "<XF86AudioMute>") #'mingus-toggle)

  (defun to-vm ()
    (interactive)
    (call-process "to-vm.sh"))

  (defun from-vm ()
    (interactive)
    (call-process "from-vm.sh"))


  (global-set-key (kbd "s-d") #'to-vm)
  (global-set-key (kbd "s-f") #'from-vm)

  (global-set-key (kbd "C-SPC") #'company-complete)

  )

(defun setup-shell ()
  (eval-after-load "term"
    '(progn (term-set-escape-char ?\C-q)
            (define-key term-raw-map (kbd "C-c") nil)))
  (eval-after-load "term"
    '(define-key term-raw-map (kbd "C-c C-c") (lambda ()(interactive)(term-send-raw-string "\C-c"))))

  (defun eshell/cat-with-syntax-highlight (filename)
    "Like cat(1) but with syntax highlighting."
    (let ((existing-buffer (get-file-buffer filename))
          (buffer (find-file-noselect filename)))
      (eshell-print
       (with-current-buffer buffer
         (if (fboundp 'font-lock-ensure)
             (font-lock-ensure)
           (with-no-warnings
             (font-lock-fontify-buffer)))
         (buffer-string)))
      (unless existing-buffer
        (kill-buffer buffer))
      nil))

  (defun eshell/imgcat (&rest args)
    "Display image(s)."
    (let ((elems (eshell-flatten-list args))
          (minibuffer-message-timeout 0))
      (if (not (file-exists-p (expand-file-name (car elems))))
          nil
        (while elems
          (call-process-shell-command
           (concat "scale-down.sh "
                   (car elems) " "
                   (number-to-string (* 0.75 (window-pixel-width))) " "
                   (number-to-string (* 0.75 (window-pixel-height)))))
          (setcar elems (concat "/tmp/" (car elems)))
          (eshell-printn
           (propertize " " 'display (create-image (expand-file-name (car elems)))))
          ;;(delete-file (car elems))
          (setq elems (cdr elems)))))) 

  (defun eshell/bettercat (filename &rest args)
    (if (equal (substring (mailcap-extension-to-mime (file-name-extension filename)) 0 5)
               "image")
        (eshell/imgcat (cons filename args))
      (eshell/cat-with-syntax-highlight filename))) 

  (advice-add 'eshell/cat :override #'eshell/bettercat) 

  (add-hook 'eshell-mode-hook
            (lambda () 
              (define-key eshell-mode-map (kbd "<tab>")
                (lambda () (interactive) (pcomplete-std-complete))))) 
  )

(defun setup-dired ()
  (setq dired-recursive-copies 'always
        dired-recursive-deletes 'always
        dired-dwim-target t
        dired-listing-switches "-alh")

  (dired-async-mode 1)
  (setq dired-recursive-copies (quote always)) ; “always” means no asking
  (setq dired-recursive-deletes (quote top)) ; “top” means ask once
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setup-settings)
  (setup-shell)
  (setup-dired)
  (setup-keybindings)
  (setenv "DISPLAY" ":0")

  (defun highlight-todos ()
    (font-lock-add-keywords nil '(("\\<\\(NOTE\\|TODO\\|HACK\\|BUG\\|XXX\\|FIXME\\):" 1 font-lock-warning-face t))))
  (add-hook 'prog-mode-hook 'highlight-todos)

  (add-hook 'text-mode-hook (lambda () (rainbow-mode 1)))

  (setq avy-all-windows nil)
  (setq avy-timeout-seconds 0.2)
  (setq avy-keys '(?a ?s ?d ?f ?k ?l ?; ?g ?h
                      ?q ?w ?e ?r ?t ?y ?i ?p
                      ?A ?S ?D ?F ?J ?K ?L))
  (define-key evil-normal-state-map (kbd "C-.") #'avy-goto-char-timer)
  (setq aw-keys '(?a ?s ?d ?f ?k ?l ?; ?g ?h
                     ?q ?w ?e ?r ?t ?y ?i ?p
                     ?A ?S ?D ?F ?J ?K ?L))

  (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  (define-key evil-normal-state-map (kbd "g a") 'paste-above)
  (define-key evil-normal-state-map (kbd "g p") 'paste-below)

  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-mode t)

  (spaceline-toggle-hud-off)

  (setq ivy-height                10
        ivy-count-format          "(%d/%d) "
        ivy-use-virtual-buffers   t
        ivy-re-builders-alist     '((t . ivy--regex-ignore-order))
        ivy-initial-inputs-alist '((org-refile . "")
                                   (org-capture-refile . "")
                                   (counsel-M-x . "")
                                   (counsel-describe-function . "")
                                   (counsel-describe-variable . "")
                                   (man . "")
                                   (woman . "")))

  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  (setq web-mode-engines-alist
        '(("cheetah" . "\\.tmpl\\'")))
  (defun my-web-mode-hook ()
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-css-indent-offset 2))
  (add-hook 'web-mode-hook  'my-web-mode-hook)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rainbow-mode nlinum-relative fuzzy flycheck-pos-tip pos-tip flycheck company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete nlinum-hl yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional cython-mode anaconda-mode pythonic wgrep smex ivy-hydra counsel-projectile counsel swiper ivy xelb alert log4e gntp exwm ws-butler winum volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed ace-link ace-jump-helm-line helm helm-core popup which-key undo-tree org-plus-contrib hydra evil-unimpaired f s dash async aggressive-indent adaptive-wrap ace-window avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (slime-company slime common-lisp-snippets rainbow-mode nlinum-relative fuzzy flycheck-pos-tip pos-tip flycheck company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete nlinum-hl yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional cython-mode anaconda-mode pythonic wgrep smex ivy-hydra counsel-projectile counsel swiper ivy xelb alert log4e gntp exwm ws-butler winum volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed ace-link ace-jump-helm-line helm helm-core popup which-key undo-tree org-plus-contrib hydra evil-unimpaired f s dash async aggressive-indent adaptive-wrap ace-window avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

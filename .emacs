(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comment-multi-line t)
 '(comment-style (quote extra-line))
 '(custom-enabled-themes (quote (misterioso)))
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(speedbar-visiting-file-hook (quote (sr-speedbar-visiting-file-hook (lambda () (other-window 1)))))
 '(package-selected-packages
   (quote
    (sr-speedbar xcscope vala-mode use-package solarized-theme paredit multi-term magit expand-region dired-single auto-complete)))
 '(term-default-fg-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(speedbar-tag-face ((t (:foreground "brown"))))
 '(term ((t (:inherit nil))))
 '(term-color-black ((t (:background "light gray" :foreground "light gray"))))
 '(term-color-blue ((t (:background "cornflower blue" :foreground "cornflower blue"))))
 '(term-color-green ((t (:background "light sea green" :foreground "light sea green"))))
 '(term-color-magenta ((t (:background "dark magenta" :foreground "dark magenta"))))
 '(term-color-red ((t (:background "indian red" :foreground "indian red"))))
 '(term-color-white ((t (:background "white smoke" :foreground "white smoke"))))
 '(term-color-yellow ((t (:background "goldenrod" :foreground "goldenrod")))))



;; working directory setup 

(setq work_dir "/home/mahathug/linux/drm-misc-2/drm-misc")
;; (setq cscope_dir "/home/mahathug/rpi4_cross_compile/linux")
(setq remote_dir "/ssh:pi@10.42.0.198:/home/pi/57/linux/")
(setq cscope_dir work_dir)

;; mutt

(server-start)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))


;; packages
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)


(dolist (package '(use-package))
   (unless (package-installed-p package)
     (package-install package)))


 (use-package paredit
   :ensure t)
;; packages end


;; cscope start

(setq cscope-do-not-update-database t)
(setq cscope-display-cscope-buffer nil)
(require 'xcscope)
(cscope-setup)

;; (setq cscope-database-regexps '( ("^/MediaFiles/testing_before_pr/gen3_devboard/platform/")))

(setq cscope-initial-directory cscope_dir)

 ;; (setq cscope-database-regexps
 ;;       '( ( "^/MediaFiles/testing_before_pr/gen3_devboard/platform/"
 ;; 	    (t)
 ;; 	    ( "/home/mahathug/Documents/Bluez/bluez-5.50" ("-d") ) ) ))
 ;; (setq cscope-database-regexps '( (work_dir)))
 ;; (setq cscope-database-regexps
 ;;       '( ( "^"work_dir
 ;; 	    (t)
 ;; 	    ( "/home/mahathug/Documents/Bluez/bluez-5.50" ("-d") ) ) ))
;; cscope end




;;cursor

(set-cursor-color "Orange") 


;; indentation style
;; (setq c-default-style "linux"
      ;; c-basic-offset 4)
;; (c-set-offset 'case-label '+)

;; whitespaces 80 cloumn rule
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; .. code-block:: none

;; .. code-block:: none

;; (defun c-lineup-arglist-tabs-only (ignored)
;;   "Line up argument lists by tabs, not spaces"
;;   (let* ((anchor (c-langelem-pos c-syntactic-element))
;;          (column (c-langelem-2nd-pos c-syntactic-element))
;;          (offset (- (1+ column) anchor))
;;          (steps (floor offset c-basic-offset)))
;;     (* (max steps 1)
;;        c-basic-offset)))

;; (dir-locals-set-class-variables
;;  'linux-kernel
;;  '((c-mode . (
;;               (c-basic-offset . 8)
;;               (c-label-minimum-indentation . 0)
;;               (c-offsets-alist . (
;;                                   (arglist-close         . c-lineup-arglist-tabs-only)
;;                                   (arglist-cont-nonempty .
;;                                                          (c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only))
;;                                   (arglist-intro         . +)
;;                                   (brace-list-intro      . +)
;;                                   (c                     . c-lineup-C-comments)
;;                                   (case-label            . 0)
;;                                   (comment-intro         . c-lineup-comment)
;;                                   (cpp-define-intro      . +)
;;                                   (cpp-macro             . -1000)
;;                                   (cpp-macro-cont        . +)
;;                                   (defun-block-intro     . +)
;;                                   (else-clause           . 0)
;;                                   (func-decl-cont        . +)
;;                                   (inclass               . +)
;;                                   (inher-cont            . c-lineup-multi-inher)
;;                                   (knr-argdecl-intro     . 0)
;;                                   (label                 . -1000)
;;                                   (statement             . 0)
;;                                   (statement-block-intro . +)
;;                                   (statement-case-intro  . +)
;;                                   (statement-cont        . +)
;;                                   (substatement          . +)
;;                                   ))
;;               (indent-tabs-mode . t)
;;               (show-trailing-whitespace . t)
;;               ))))

;; (dir-locals-set-directory-class
;;  (expand-file-name work_dir)
;;  'linux-kernel)

(defun linux-c-mode ()
 "C mode with adjusted defaults for use with the Linux
kernel."
 (interactive)
 (c-mode)
 (setq c-basic-offset 8)
 (setq c-indent-level 8)
 (setq c-brace-imaginary-offset 0)
 (setq c-brace-offset -8)
 (setq c-argdecl-indent 8)
 (setq c-label-offset -8)
 (setq c-continued-statement-offset 8)
 (setq indent-tabs-mode nil)
 (setq tab-width 8))
 (setq c-set-style "linux-tabs-only")

;; (defun c-lineup-arglist-tabs-only (ignored)
;;   "Line up argument lists by tabs, not spaces"
;;   (let* ((anchor (c-langelem-pos c-syntactic-element))
;;          (column (c-langelem-2nd-pos c-syntactic-element))
;;          (offset (- (1+ column) anchor))
;;          (steps (floor offset c-basic-offset)))
;;     (* (max steps 1)
;;        c-basic-offset)))

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             ;; Add kernel style
;;             (c-add-style
;;              "linux-tabs-only"
;;              '("linux" (c-offsets-alist
;;                         (arglist-cont-nonempty
;;                          c-lineup-gcc-asm-reg
;;                          c-lineup-arglist-tabs-only))))))

;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (let ((filename (buffer-file-name)))
;;               ;; Enable kernel mode for the appropriate files
;;               (when (and filename
;;                          (string-match (expand-file-name work_dir)
;;                                        filename))
;;                 (setq indent-tabs-mode t)
;;                 (setq show-trailing-whitespace t)
;;                 (c-set-style "linux-tabs-only")))))

;; indentaion style end


;; tramp
(setq tramp-default-method "ssh")


;; emacs client
(require 'server)
(or (server-running-p) (server-start))
;; emacs client end






;; comment style
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
  (global-set-key (kbd "C-;") 'comment-or-uncomment-region-or-line)
;; comment style end






;; git
;; (require 'git)
;; (require 'git-blame)
;; git end





;; region casing
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; regio casing end



;; normal autocmplete
(require 'auto-complete)
(global-auto-complete-mode t)
;; normal autocomplet end




;; parenthesis
(show-paren-mode t)

(defadvice show-paren-function
      (after show-matching-paren-offscreen activate)
      "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
      (interactive)
      (let* ((cb (char-before (point)))
             (matching-text (and cb
                                 (char-equal (char-syntax cb) ?\) )
                                 (blink-matching-open))))
        (when matching-text (message matching-text))))


;; parenthesis end





;; magit
(add-to-list 'load-path "~/.emacs.d/site-lisp/magitlisp")
(require 'magit)



(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/site-lisp/magit/Documentation/"))
;; magit end



;; mutiiterm
(require 'multi-term)
(setq multi-term-program "/bin/bash")
;; multiterm end



;; Custom legato
(defun rpi-configure()
  (interactive )
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (when (get-buffer "ssh")
    (kill-buffer "ssh"))
  (when (get-buffer "dmesg")
    (kill-buffer "dmesg"))
  (when (get-buffer "extra")
    (kill-buffer "extra"))
  (let* ((buffer-name (format "dmesg"))
         (buffer (get-buffer buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      ;; (term "/bin/bash")
       (multi-term)
       (term-send-string
	(get-buffer-process (rename-buffer buffer-name))
	(format "sshpass -p raspberry ssh pi@10.42.0.198\r dmesg |grep fb\r dmesg -w\r"))))
  (let* ((buffer-name (format "extra"))
         (buffer (get-buffer buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      (multi-term)
      (term-send-string
       (get-buffer-process (rename-buffer buffer-name))
       (format "sshpass -p raspberry ssh pi@10.42.0.198\r"))))
  (let* ((buffer-name (format "ssh"))
     (buffer (get-buffer buffer-name)))
    (if buffer
    (switch-to-buffer buffer)
      ;; (term "/bin/bash")
      (multi-term)
      (term-send-string
       (get-buffer-process (rename-buffer buffer-name))
       (format "sshpass -p raspberry ssh pi@10.42.0.198\r cd 57/linux\r"))))
  )
;; custom legato end


(defun rebuild-scorpio()
  (interactive )
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (when (get-buffer "rebuild")
    (kill-buffer "rebuild"))
  (let* ((buffer-name (format "rebuild"))
         (buffer (get-buffer buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      (shell )
      (process-send-string
       (get-buffer-process (rename-buffer buffer-name))
       (concat "cd " work_dir "scorch" "\n" "python scorch.py -r\n"  ) ))))

(defun deploy-scorpio()
  (interactive )
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (when (get-buffer "deploy")
    (kill-buffer "deploy"))
  (let* ((buffer-name (format "deploy"))
         (buffer (get-buffer buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      (shell )
      (process-send-string
       (get-buffer-process (rename-buffer buffer-name))
       (concat "cd " work_dir "scorch" "\n" "python scorch.py -d tc\n"  ) ))))

;; (defun generate-dfu()
;;   (interactive )
;;   (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
;;   (when (get-buffer "generate_dfu")
;;     (kill-buffer "generate_dfu"))
;;   (let* ((buffer-name (format "generate_dfu"))
;;          (buffer (get-buffer buffer-name)))
;;     (if buffer
;;         (switch-to-buffer buffer)
;;       (shell )
;;       (process-send-string
;;        (get-buffer-process (rename-buffer buffer-name))
;;        (concat "cd " work_dir "scorch" "\n" "python scorch.py --dfu\n" "copy " work_dir "application\\output\\dfu\\platform.bin " work_dir "taf\\taf\\lib\\toolbox\\python\\app\\OTAUpgrader /y \n"  ) ))))

(defun generate-dfu()
  (interactive )
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (when (get-buffer "generate_dfu")
    (kill-buffer "generate_dfu"))
  (let* ((buffer-name (format "generate_dfu"))
         (buffer (get-buffer buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      (shell )
      (process-send-string
       (get-buffer-process (rename-buffer buffer-name))
       (concat "cd " work_dir "scorch" "\n" "python scorch.py --dfu\n" "copy " work_dir "application\\output\\dfu\\hs_upgrade.bin " work_dir "taf\\taf\\lib\\toolbox\\python\\app\\OTAUpgrader /y \n"  ) ))))


(defun do-otau-upgrade()
  (interactive )
  (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
  (when (get-buffer "do_otau_upgrade")
    (kill-buffer "do_otau_upgrade"))
  (let* ((buffer-name (format "do_otau_upgrade"))
         (buffer (get-buffer buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      (shell )
      (process-send-string
       (get-buffer-process (rename-buffer buffer-name))
       (concat "cd " work_dir "taf\\taf\\lib\\toolbox\\python\\app\\OTAUpgrader" "\n" "python OTAUpgrader.py \n"  ) ))))

;; custom senn end
;; "cd " work_dir "scorch" "\n" "python scorch.py --dfu\n"














;; first file
(pop-to-buffer (find-file "~/.emacs"))
;; first file end



;; (require 'dired+)
;; (diredp-toggle-find-file-reuse-dir 1)

;; disable auto-save and auto-backup
;; (setq auto-save-default nil)
;; (setq make-backup-files nil)
;; disable auto save and auto backup end



;; adding working repo
(defun repo-configure()
  (interactive )
  (when (get-buffer "repo")
    (kill-buffer "repo"))
  (let* ((buffer-name (format "repo"))
         (buffer (get-buffer buffer-name)))
    (if buffer
	(switch-to-buffer buffer)
      (pop-to-buffer (find-file "/home/user/.swi/legato-af/graham_ccm_18.05.rc1/legato-18.05.0.rc1/apps/graham_ccm"))
      (get-buffer-process (rename-buffer buffer-name))
      )
    ))
;; adding working repo end
;; ('repo-configure)
;; (global-set-key (kbd "M-1") (lambda () (interactive) (switch-to-buffer "repo")))
(defun legato-framework()
  (interactive )
  (when (get-buffer "legato")
    (kill-buffer "legato"))
  (let* ((buffer-name (format "legato"))
         (buffer (get-buffer buffer-name)))
    (if buffer
	(switch-to-buffer buffer)
      (pop-to-buffer (find-file "/home/user/.swi/legato-af/legato-18.04.0"))
      (get-buffer-process (rename-buffer buffer-name))
      )
    ))

(defun legato-framework-1805()
  (interactive )
  (when (get-buffer "legato-1805")
    (kill-buffer "legato-1805"))
  (let* ((buffer-name (format "legato-1805"))
         (buffer (get-buffer buffer-name)))
    (if buffer
	(switch-to-buffer buffer)
      (pop-to-buffer (find-file "/home/user/.swi/legato-af/legato-af.16104/apps/graham_ccm"))
      (get-buffer-process (rename-buffer buffer-name))
      )
    ))


(defun legato-framework-161004()
  (interactive )
  (when (get-buffer "legato-161004cwe")
    (kill-buffer "legato-161004cwe"))
  (let* ((buffer-name (format "legato-161004cwe"))
         (buffer (get-buffer buffer-name)))
    (if buffer
	(switch-to-buffer buffer)
      (pop-to-buffer (find-file "/home/user/.swi/legato-af/graham_ccm_18.05.rc1/legato-18.05.0.rc1"))
      (get-buffer-process (rename-buffer buffer-name))
      )
    ))


;; (diredp-toggle-find-file-reuse-dir 1)
;; (put 'dired-find-alternate-file 'disabled nil)


;; (require 'dired+)
;; (diredp-toggle-find-file-reuse-dir 1)





;; term mode control characters
(defun term-send-esc ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\e"))

(add-to-list 'term-bind-key-alist '("C-c C-e" . term-send-escape))

(defun term-send-X ()
  "Send X in term mode."
  (interactive)
  (term-send-raw-string "\C-x"))

(add-to-list 'term-bind-key-alist '("C-c C-x" . term-send-X))


(defun term-send-reverse-search ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\C-r"))

(add-to-list 'term-bind-key-alist '("C-c C-r" . term-send-reverse-search))

;; term mode control characters end




;; dired single
;; todo
;; (require 'dired-single)
;; (setq dired-single-use-magic-buffer t)
;; (setq dired-single-magic-buffer-name '"repo")

;; (setq term-buffer-maximum-size 0) 
;; dired single end


;; speedbar
(use-package sr-speedbar
  :ensure t
  :defer t
  :init
  ;; '(speedbar-visiting-file-hook (lambda () (other-window 1)))
  (setq sr-speedbar-right-side nil)
  (setq speedbar-show-unknown-files t)
  (setq sr-speedbar-width 35)
  (setq sr-speedbar-max-width 35)
  (setq speedbar-use-images nil)
  (setq speedbar-initial-expansion-list-name "files")
  (setq sr-speedbar-auto-refresh t)
  (setq sr-speedbar-skip-other-window-p t)
  ;; (sr-speedbar-open)
  ;; (speedbar)
  :config
  (with-current-buffer sr-speedbar-buffer-name
    (setq window-size-fixed 'width))
  )

;; centered cursor mode, definitely move to a new file
 ;; (if (display-graphic-p) (and
 ;;      (require 'centered-cursor-mode)
 ;;      (global-centered-cursor-mode +1)))
;; Compilation

(setq default-process-coding-system '(utf-8-unix . utf-8-unix))


(defun compile-app ()
  "compile grhama_ccm"
  (interactive)
  (let ((default-directory "/home/user/.swi/legato-af/graham_ccm_18.05.rc1/legato-18.05.0.rc1/apps/graham_ccm/"))
    (compile "make clean;make")))

(defun install-app ()
  "install graham_ccm"
  (interactive)
  (let ((default-directory "/home/user/.swi/legato-af/graham_ccm_18.05.rc1/legato-18.05.0.rc1/apps/graham_ccm/"))
    (compile "make install-app")))

(defun compile-legato ()
  "compile graham_ccm cwe"
  (interactive)
  (let ((default-directory "/home/user/.swi/legato-af/graham_ccm_18.05.rc1/legato-18.05.0.rc1/"))
    (compile "make clean;make wp85 ")))

(defun install-legato ()
  "install graham_ccm cwe"
  (interactive)
  (let ((default-directory "/home/user/.swi/legato-af/graham_ccm_18.05.rc1/legato-18.05.0.rc1/"))
    (compile "export LEGATO_ROOT=$PWD;export PATH=$LEGATO_ROOT/bin:$PATH:$LEGATO_ROOT/build/localhost/framework/bin;export WP85_TOOLCHAIN_DIR=/opt/swi/LXSWI2.2-6.0.rc1+wp85xx/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/;export WP85_TOOLCHAIN_PREFIX=arm-poky-linux-gnueabi-;fwupdate download build/wp85/legato.cwe 192.168.2.2")))

;; (setq-default compile-command "export WP85_TOOLCHAIN_PREFIX=arm-poky-linux-gnueabi-;make clean;make -C /home/user/.swi/legato-af/graham_ccm_18.05.rc1/legato-18.05.0.rc1/apps/graham_ccm/ -k;make install-app")

(setq compilation-read-command nil)

(setq compilation-scroll-output t)

;; (setq compilation-scroll-output 'first-error)








;; ediff

(setq ediff-split-window-function 'split-window-horizontally)






;; (setenv "PATH" (concat "/home/user/.swi/legato-af/graham_ccm_18.05.rc1/legato-18.05.0.rc1/bin;/home/user/.swi/legato-af/graham_ccm_18.05.rc1/legato-18.05.0.rc1/build/localhost/framework/bin;" (getenv "PATH")))

;; compilation end

;; add it to .bashrc
;; function e() { 
;;   	if test -e "/tmp/emacs1000/server" || test -e "~/.emacs.d/server"
;; 	then 
;; 		emacsclient "$@" &
;; 		echo "opening the file with previous emacs instance"
;; 	else
;; 	       	emacs "$@" &  
;; 		echo "creating new emacs instance"
;; 	fi
;;        	}





;; shortcuts

;; Alt shortcuts

(global-set-key (kbd "M-3") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir "/drivers/gpu/drm/tiny/ili9225.c")))))

(global-set-key (kbd "M-2") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir "/drivers/gpu/drm/tiny/ili9488.c")))))

(global-set-key (kbd "M-4") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir "/drivers/gpu/drm/tiny/ili9341.c")))))

(global-set-key (kbd "M-5") (lambda () (interactive) (switch-to-buffer (find-file (concat work_dir "/drivers/gpu/drm/tiny/st7586.c")))))

(global-set-key (kbd "M-1") (lambda () (interactive) (switch-to-buffer (find-file  (concat work_dir "/drivers/gpu/drm/tiny")))))

(global-set-key (kbd "M-8") 'legato-framework-1805)

(global-set-key (kbd "M-9") 'legato-framework-161004)

(global-set-key (kbd "M-0") (lambda () (interactive) (switch-to-buffer ".emacs")))

(global-set-key (kbd "M-q") 'compile-legato)

(global-set-key (kbd "M-p") 'install-legato)

(global-set-key (kbd "M-c") 'compile-app)

(global-set-key (kbd "M-n") 'install-app)

(global-set-key (kbd "M-s") 'tags-search)



;; ctrl 

(global-set-key (kbd "C-<f1>") 'rpi-configure)

(global-set-key (kbd "C-<f4>") (lambda () (interactive) (switch-to-buffer "extra")))

(global-set-key (kbd "C-<f2>") (lambda () (interactive) (switch-to-buffer "ssh")))

(global-set-key (kbd "C-<f3>") (lambda () (interactive) (switch-to-buffer "dmesg")))



;; switch-to-buffer (find-file (concat work_dir "/appkit/scorpio/otauMan")))))

(global-set-key (kbd "C-3") (lambda () (interactive) (switch-to-buffer (find-file  (concat remote_dir "/drivers/gpu/drm/tiny/ili9225.c")))))

(global-set-key (kbd "C-4") (lambda () (interactive) (switch-to-buffer (find-file  (concat remote_dir "/drivers/gpu/drm/tiny/ili9341.c")))))

(global-set-key (kbd "C-2") (lambda () (interactive) (switch-to-buffer (find-file (concat remote_dir "/drivers/gpu/drm/tiny/ili9488.c")))))

(global-set-key (kbd "C-1") (lambda () (interactive) (switch-to-buffer (find-file (concat remote_dir "/drivers/gpu/drm/tiny/")))))

(global-set-key (kbd "C-5") (lambda () (interactive) (switch-to-buffer (find-file (concat remote_dir "/drivers/gpu/drm/tiny/st7789vw.c")))))

;; (global-set-key (kbd "C-<tab>") 'next-buffer)

;; (global-set-key (kbd "C-`") 'previous-buffer)

(global-set-key (kbd "M-m") 'magit-status)

;; (global-set-key (kbd "M-0") 'repo-configure)

;; (global-set-key (kbd "M-7") 'legato-framework)



(global-set-key [M-insert] '(lambda() (interactive) (load-file "~/.emacs")))

;; (global-set-key (kbd "C-2") (lambda () (interactive) (switch-to-buffer "*compilation*")))



;; (global-set-key (kbd "C-1") 'sr-speedbar-toggle)

(global-set-key (kbd "C-`") 'other-window)

;; (global-set-key (kbd "C-2") 'sr-speedbar-select-window)

;; (global-unset-key (kbd "C-l"))

;; ;; (global-unset-key (kbd "C-i"))         

;; (global-unset-key (kbd "C-k"))

;; (global-unset-key (kbd "C-j"))


;; (global-set-key [?\H-i] 'previous-line 	)

;; (global-set-key  (kbd "C-j") 'backward-char)

;; (global-set-key (kbd "C-k") 'next-line)

;; (global-set-key (kbd "C-l") 'forward-char)

;; (globl-set-key [C-i] 'forward-char forward-line previous-line 	backward-char next-line)

(global-unset-key [menu])




; (define-key global-map [(menu) (s)] (kbd "C-c s"))
;; (global-set-key (kbd "<menu>") (kbd "M-x"))

;; (define-key global-map [(menu)] cscope-find-this-symbol)
;; (global-set-key (kbd "<menu>") (lookup-key global-map (kbd "C-c s")))


(define-key cscope-minor-mode-keymap (kbd "<menu>") (lookup-key cscope-minor-mode-keymap (kbd "C-c s")))

;; shortcuts end



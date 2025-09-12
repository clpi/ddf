;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el
;;;
(package! copilot
  :recipe (:host github :repo "copilot-emacs/copilot.el" :files ("*.el")))

(package! codeium :recipe (:host github :repo "Exafunction/codeium.el"))

;; (package! leetcode :recipe (:host github :repo "kaiwk/leetcode.el"))


(package! lsp-ui)

(package! lsp-treemacs)

(package! lsp-ivy)

;; (when (package! lsp-bridge
;;         :recipe (:host github
;;                  :repo "manateelazycat/lsp-bridge"
;;                  :branch "master"
;;                  :files ("*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
;;                  ;; do not perform byte compilation or native compilation for lsp-bridge
;;                  :build (:not compile)))
(package! markdown-mode)
(package! yasnippet)
(package! org-download)
(package! org-transclusion)
(package! org-ai)
(package! org-ql)
(package! copilot-chat)
(package! ox-hugo)
(package! minuet)
(package! cape)
(package! corfu-candidate-overlay)
(package! kind-icon)
(package! corfu-terminal)
(package! orderless)
;; (package! org-caldav-sync)

;; (package! org-caldav-sync
;;   :recipe (:host github :repo "alphapapa/org-caldav-sync"
;;            :files ("*.el" "lisp/*.el" "lisp/org-caldav-sync.el")))

(package! org-super-agenda)

(package! gptel :recipe (:nonrecursive t))

(package! info-colors)

(if IS-MAC (package! org-mac-link))

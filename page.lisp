(load "site.lisp")

(defparameter pages '("index" "about" "projects" "helix"))

(defun page-header (current-page)
  (div (:class "header")
       (div (:class "title")
            (div () "Gaby")
            (a (:href "https://github.com/gabydd") (img (:src "octocat-lisp.png" :width "200" :height "200" :style "width:min(16vw, 16vh);"))))
       (div (:class "nav")
            (dohtml (page pages)
                    (a (:class (conc-str "link" (when (equal page current-page) " link-current"))
                        :href (conc-str page ".html"))
                       page)))))

(defparameter footer
  (div (:class "footer")
       "Made with a little bit of lisp and a whole lot of love"
       (img (:src "lisp-warning.png" :width "83" :height "128" :style "width:max(6vw, 6vh);margin-left:auto;"))))

(defparameter styles (eval (with-open-file (file (conc-str "css.lisp")) (read file))))

(defmacro template (page &rest body)
  `(conc-str "<!DOCTYPE HTML>"
             (html (:lang "en")
                   (head ()
                         (meta (:charset "UTF-8"))
                         (meta (:name "viewport" :content "width=device-width, initial-scale=1.0"))
                         (meta (:http-equiv "X-UA-Compatible" :content "ie=edge"))
                         (title () "The site of Gaby")
                         (style () styles))
                   (body ()
                         (page-header ,page)
                         (div (:class "body") ,@body)
                         footer))))

(dolist (page pages)
  (write-html (template page (eval (with-open-file (file (conc-str page ".lisp")) (read file)))) page))

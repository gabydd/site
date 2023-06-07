(load "site.lisp")

(defparameter pages '("index" "about" "projects" "helix"))

(defun page-header (current-page)
  (nav (:class "header")
       "Gaby"
       (div (:class "nav")
            (dohtml (page pages)
                    (div (:class "nav-item")
                          (a (:class (if (equal page current-page) "link-current" "link")
                              :href (conc-str page ".html"))
                             page))))))

(defparameter footer
  (div ()
       "Made with a little bit of lisp and a whole lot of love"
       (a (:href "https://github.com/gabydd") "Github")))
(defmacro template (page &rest body)
  `(conc-str "<!DOCTYPE HTML>"
             (html (:lang "en")
                   (head ()
                         (meta (:charset "UTF-8"))
                         (meta (:name "viewport" :content "width=device-width, initial-scale=1.0"))
                         (meta (:http-equiv "X-UA-Compatible" :content "ie=edge"))
                         (title () "The site of Gaby")
                         (link (:rel "stylesheet" :href "style.css")))
                   (body ()
                         (page-header ,page)
                         ,@body
                         footer))))

(dolist (page pages)
  (write-html (template page (eval (with-open-file (file (conc-str page ".lisp")) (read file)))) page))

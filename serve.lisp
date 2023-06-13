(quicklisp:quickload :hunchentoot)
(quicklisp:quickload :cl-inotify)

(defparameter *acceptor* (make-instance 'hunchentoot:easy-acceptor :port 4444
                                   :document-root #p"serve/"))
(hunchentoot:start *acceptor*)

(load "page.lisp")
(cl-inotify:with-inotify (inotify t ("." '(:modify :dont-follow)))
  (cl-inotify:do-events (event inotify :blocking-p t)
    (print "A file changed: regenerating")
    (handler-case (load "page.lisp")
        (error (c)
          (print c)))))

(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

(defun filtra-por-perigo (catalogo)
  (remove-if #'(lambda (c)
                 (eq (criatura-periculosidade c) 'BAIXA))
             catalogo))

(defun relatorio-profundidade (catalogo)
  (mapcar #'(lambda (c)
              (format nil "~a: Vive em ~a"
                      (criatura-nome c)
                      (criatura-ambiente c)))
          (remove-if-not #'(lambda (c)
                             (string= (criatura-ambiente c) "Deep"))
                         catalogo)))

(defun descricao-criatura (c)
  (format nil "Nome: ~a | Ambiente: ~a | Periculosidade: ~a"
          (criatura-nome c)
          (criatura-ambiente c)
          (criatura-periculosidade c)))

(defun main ()
  (let ((catalogo
          (list
            (make-criatura :nome "Peeper"
                           :ambiente "Safe Shallows"
                           :periculosidade 'BAIXA
                           :vida-media 5)
            (make-criatura :nome "Reaper Leviathan"
                           :ambiente "Crash Zone"
                           :periculosidade 'ALTA
                           :vida-media 100)
            (make-criatura :nome "Ghost Leviathan"
                           :ambiente "Deep"
                           :periculosidade 'ALTA
                           :vida-media 200)
            (make-criatura :nome "Blighter"
                           :ambiente "Deep"
                           :periculosidade 'MEDIA
                           :vida-media 15))))

    (format t "=== Scanner - Planet 4546B ===~%~%")

    (format t "--- Catalogo Completo ---~%")
    (dolist (c catalogo)
      (format t "  ~a~%" (descricao-criatura c)))
       
    (format t "~%--- Criaturas Perigosas ---~%")
    (dolist (c (filtra-por-perigo catalogo))
      (format t "  ~a~%" (descricao-criatura c)))

    (format t "~%--- Relatorio de Profundidade (Deep) ---~%")
    (dolist (linha (relatorio-profundidade catalogo))
      (format t "  ~a~%" linha))))

(main)

(defstruct erva
  nome
  preco-base)

(defun calcula-dosagem (peso idade)
  (cond
    ((or (< idade 6) (< peso 20.0)) "10ml")
    ((or (< idade 12) (< peso 50.0)) "25ml")
    (t "50ml")))

(defun ajusta-preco (erva)
  (let ((nome (erva-nome erva))
        (base (erva-preco-base erva)))
    (cond
      ((string= nome "Ginseng") (* base 3.0))
      ((string= nome "Lotus")   (* base 1.5))
      (t base))))

(defun descricao-erva (erva peso idade)
  (format nil "Erva: ~a | Preco: R$~,2f | Dosagem: ~a"
          (erva-nome erva)
          (ajusta-preco erva)
          (calcula-dosagem peso idade)))

(defun main ()
  (let ((ginseng  (make-erva :nome "Ginseng"  :preco-base 100.0))
        (lotus    (make-erva :nome "Lotus"    :preco-base 80.0))
        (camomila (make-erva :nome "Camomila" :preco-base 30.0)))

    (format t "=== Farmacia da Maomao ===~%~%")

    (format t "Paciente 1 - Joao (4 anos, 15kg):~%")
    (format t "  ~a~%" (descricao-erva ginseng  15.0 4))
    (format t "  ~a~%" (descricao-erva lotus    15.0 4))
    (format t "  ~a~%~%" (descricao-erva camomila 15.0 4))

    (format t "Paciente 2 - Ana (9 anos, 35kg):~%")
    (format t "  ~a~%" (descricao-erva ginseng  35.0 9))
    (format t "  ~a~%" (descricao-erva lotus    35.0 9))
    (format t "  ~a~%~%" (descricao-erva camomila 35.0 9))

    (format t "Paciente 3 - Carlos (30 anos, 70kg):~%")
    (format t "  ~a~%" (descricao-erva ginseng  70.0 30))
    (format t "  ~a~%" (descricao-erva lotus    70.0 30))
    (format t "  ~a~%"  (descricao-erva camomila 70.0 30))))

(main)

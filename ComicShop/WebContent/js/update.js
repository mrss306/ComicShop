document.addEventListener('DOMContentLoaded', function() {
    const forms = document.querySelectorAll('form[action="ProductUpdate"]');
    const errorSpan = document.getElementById('uerrorspan');
    const alertDiv = document.querySelector('.ualert');
    const closeBtn = document.querySelector('.uclosebtn');

    const patterns = {
        nome: /^.+$/, // Qualsiasi carattere (almeno uno)
        prezzo: /^\d+(\.\d{1,2})?$/, // Numero con max 2 decimali
        voto: /^(10|[0-9])$/, // Numero 0-10
        quantita: /^[1-9]\d*$/, // Numero intero positivo
        saldo: /^\d+(\.\d+)?$/, // Numero positivo (intero o decimale)
        descrizione: /^.+$/, // Qualsiasi carattere (almeno uno)
        peso: /^\d+(\.\d{1,2})?$/ // Numero con max 2 decimali
    };

    const errorMessages = {
        nome: "Il nome è obbligatorio",
        prezzo: "Prezzo non valido (max 2 decimali)",
        voto: "Voto non valido (deve essere un numero tra 0 e 10)",
        quantita: "Quantità non valida (minimo 1)",
        saldo: "Saldo non valido (deve essere un numero positivo)",
        descrizione: "La descrizione è obbligatoria",
        peso: "Peso non valido (max 2 decimali)"
    };

    if (alertDiv) alertDiv.style.display = 'none';

    if (closeBtn) {
        closeBtn.addEventListener('click', function() {
            if (alertDiv) alertDiv.style.display = 'none';
        });
    }

    if (forms) {
        forms.forEach(form => {
            form.addEventListener('submit', function(e) {
                let isValid = true;
                let firstErrorField = null;

                form.querySelectorAll('input').forEach(input => {
                    if (input.name && input.type !== 'submit' && input.type !== 'hidden') {
                        const value = input.value.trim();
                        const fieldName = input.name;

                        if (patterns[fieldName] && !patterns[fieldName].test(value)) {
                            isValid = false;
                            if (!firstErrorField) firstErrorField = input;
                            input.style.borderColor = '#f44336';
                            input.style.borderWidth = '2px';
                        } else {
                            input.style.borderColor = '';
                            input.style.borderWidth = '';
                        }
                    }
                });

                if (!isValid) {
                    e.preventDefault();
                    if (errorSpan && alertDiv && firstErrorField) {
                        errorSpan.textContent = errorMessages[firstErrorField.name] || "Errore nel campo";
                        alertDiv.style.display = 'block';
                        firstErrorField.focus();
                        setTimeout(() => {
                            if (alertDiv) alertDiv.style.display = 'none';
                        }, 10000);
                    }
                }
            });

		
        });
    }
});
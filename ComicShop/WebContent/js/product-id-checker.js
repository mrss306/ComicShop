document.addEventListener('DOMContentLoaded', function() {
    const idInput = document.querySelector('input[name="id"]');
    const errorSpan = document.getElementById('errorspan');
    const alertDiv = document.querySelector('.alert');
    
    if (!idInput) return; 
    
    idInput.addEventListener('blur', checkId);
    idInput.addEventListener('input', handleInputChange);
    
    let lastValidState = null;
    
    function checkId() {
        const id = this.value.trim();
        checkProductIdAvailability(id);
    }
    
    function handleInputChange() {
        const id = this.value.trim();
        
        if (!id || isNaN(id)) {
            resetField();
            return;
        }
        
        const numId = parseInt(id);
        if (numId <= 0) {
            idInput.style.borderColor = '#f44336';
            showError("L'ID deve essere un numero maggiore di 0");
            lastValidState = false;
            return;
        }
        
        if (lastValidState === false) {
            resetField();
        }
    }
    
    function resetField() {
        idInput.style.borderColor = '';
        hideError();
    }
    
    function checkProductIdAvailability(id) {
        if (!id || isNaN(id)) {
            resetField();
            return;
        }
        
        const numId = parseInt(id);
        if (numId <= 0) {
            idInput.style.borderColor = '#f44336';
            showError("L'ID deve essere un numero maggiore di 0");
            lastValidState = false;
            return;
        }
                
        const xhr = new XMLHttpRequest();
        xhr.open('GET', `ProductInsert?checkId=${encodeURIComponent(id)}`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        
        xhr.onload = function() {
            if (this.status === 200) {
                const response = JSON.parse(this.responseText);
                
                if (response.exists) {
                    idInput.style.borderColor = '#f44336';
                    showError("ID prodotto già in uso. Scegline un altro.");
                    lastValidState = false;
                } else {
                    idInput.style.borderColor = '#4CAF50';
                    hideError();
                    lastValidState = true;
                }
            } else {
                console.error("Errore nel controllo ID prodotto");
                resetField();
            }
        };
        
        xhr.onerror = function() {
            console.error("Errore di connessione");
            resetField();
        };
        
        xhr.send();
    }
    
    function showError(message) {
        if (!errorSpan || !alertDiv) return;
        errorSpan.textContent = message;
        alertDiv.style.display = 'block';
    }
    
    function hideError() {
        if (!alertDiv) return;
        alertDiv.style.display = 'none';
    }
});
document.addEventListener('DOMContentLoaded', function() {
    const usernameInput = document.querySelector('input[name="usr"]');
    const errorSpan = document.getElementById('errorspan');
    const alertDiv = document.querySelector('.alert');
    
    if (!usernameInput) return; // Se non c'è il campo username, esci
    
    usernameInput.addEventListener('blur', function() {
        checkUsernameAvailability(this.value.trim());
    });
    
    function checkUsernameAvailability(username) {
        if (username.length < 2) return; // Non controllare se minore di due perché di per se non è legale
                
        // Chiamata AJAX
        const xhr = new XMLHttpRequest();
        xhr.open('GET', `UserControl?checkUsername=${encodeURIComponent(username)}`, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        
        xhr.onload = function() {
            if (this.status === 200) {
                const response = JSON.parse(this.responseText);
                
                if (response.exists) {
                    usernameInput.style.borderColor = '#f44336';//rosso
                    showError("Username già in uso. Scegline un altro.");
                } else {
                    usernameInput.style.borderColor = '#4CAF50';//verde
                    hideError();
                }
            } else {
                console.error("Errore nel controllo username");
                usernameInput.style.borderColor = '';
            }
        };
        
        xhr.onerror = function() {
            console.error("Errore di connessione");
            usernameInput.style.borderColor = '';
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
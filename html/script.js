window.addEventListener('message', function(event) {
    if (event.data.action === 'notification') {
        showNotification(event.data.type, event.data.message);
    }
});

function showNotification(type, message) {
    const container = document.getElementById('notifications-container');
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;

    let icon;
    switch(type) {
        case 'success':
            icon = 'fa-check';
            break;
        case 'error':
            icon = 'fa-times';
            break;
        case 'warning':
            icon = 'fa-exclamation';
            break;
        case 'info':
            icon = 'fa-info';
            break;
        default:
            icon = 'fa-bell';
    }

    const typeLabel = type.charAt(0).toUpperCase() + type.slice(1);

    notification.innerHTML = `
        <div class="notification-content">
            <div class="notification-icon">
                <i class="fas ${icon}"></i>
            </div>
            <span class="notification-message">${message}</span>
            <span class="notification-type">${typeLabel}</span>
        </div>
        <div class="progress-bar">
            <div class="progress"></div>
        </div>
    `;

    container.appendChild(notification);

    const audio = new Audio('assets/audio.mp3');
    audio.volume = 0.3; // Sesi biraz daha kısık
    audio.play().catch(function(error) {
        console.log("Audio play failed:", error);
    });

    const progress = notification.querySelector('.progress');
    progress.style.animation = 'progress 3s linear forwards';

    setTimeout(() => {
        notification.classList.add('hiding');
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 3000);
}

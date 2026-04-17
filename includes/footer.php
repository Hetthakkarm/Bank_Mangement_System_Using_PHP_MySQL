            </section>
        </main>
    </div>
    <script>
        // Auto-hide flash messages after 4 seconds
        document.querySelectorAll('.flash-banner').forEach(el => {
            setTimeout(() => { el.style.opacity = '0'; el.style.transform = 'translateY(-10px)'; setTimeout(() => el.remove(), 300); }, 4000);
        });
    </script>
</body>
</html>

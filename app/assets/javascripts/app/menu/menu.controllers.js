(function() {

    'use strict';

    angular
        .module(APP_NAME)
        .controller('MenuController', MenuController);

    MenuController.$inject = ['$translate', 'Auth', 'User', 'RedirectService'];

    function MenuController($translate, Auth, User, RedirectService) {

        var vm = this;

        vm.logout = logout;
        vm.changeMenuDisplay = changeMenuDisplay;
        vm.collapseMenu = false;

        Auth.currentUser().then(function(current_user) {
            vm.user = current_user;
            User.get({id: current_user.id}, function(user) {
                user.$settings(function(setting) {
                    $translate.use(setting.preferred_language_key);
                });
            });
        });
     
        function logout() {
            var config = {
                headers: { 'X-HTTP-Method-Override': 'DELETE' }
            };

            Auth.logout(config).then(function(oldUser) {
                window.location.href = "/";
            }, function(error) {
                
            });
        }

        function changeMenuDisplay() {
            jQuery("#wrapper").toggleClass("toggled", vm.collapseMenu);
            if (vm.collapseMenu) {
                jQuery("[data-toggle='menu-tooltip']").tooltip();
            } else {
                jQuery("[data-toggle='menu-tooltip']").tooltip('destroy');
            }
        }

    }
    
})();
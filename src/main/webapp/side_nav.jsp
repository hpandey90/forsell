
    <link href="css/bootstrap.css" rel="stylesheet">
 

    <!-- 
      jQuery-menu-aim: the following styles are used to customize bootstrap's
      dropdowns and popover to play a little nicer w/ this example. They are
      personal choices and not necessary for your use of jQuery-menu-aim.
      jQuery-menu-aim is HTML/style-agnostic, it simply fires events when menu
      items should be activated.
      You can choose to do whatever you want w/ those events.
    -->
    <style>
        .navbar .popover {
            width: 400px;
            -webkit-border-top-left-radius: 0px;
            -webkit-border-bottom-left-radius: 0px;
            border-top-left-radius: 0px;
            border-bottom-left-radius: 0px;
            overflow: hidden;
        }

        .navbar .popover-content {
            text-align: center;
        }

        .navbar .popover-content img {
            height: 212px;
            max-width: 250px;
        }

        .navbar .dropdown-menu {
            -webkit-border-top-right-radius: 0px;
            -webkit-border-bottom-right-radius: 0px;
            border-top-right-radius: 0px;
            border-bottom-right-radius: 0px;

            -webkit-box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
        }

        .navbar .dropdown-menu > li > a:hover {
            background-image: none;
            color: white;
            background-color: rgb(0, 129, 194);
            background-color: rgba(0, 129, 194, 0.5);
        }

        .navbar .dropdown-menu > li > a.maintainHover {
            color: white;
            background-color: #0081C2;
        }
    </style>

    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
    <![endif]-->

    <div class="navbar" hidden>
        <div class="container">
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active open">
                <!--
                  jQuery-menu-aim: this <ul> defines the dropdown main menu and its contents.
                  This is just one of many possible examples for defining the menu's HTML.
                  jQuery-menu-aim is agnostic to your HTML structure, it only fires events to
                  be used as you please.
                -->
                <ul class="dropdown-menu" role="menu">
                    <li data-submenu-id="submenu-patas">
                        <a href="#">Patas</a>
                        <!--
                          jQuery-menu-aim: each class="popover" div defines submenu content. There are a million
                          and one ways to do this, places to structure the HTML, etc. This is just one example.
                          jQuery-menu-aim is agnostic to your HTML structure, it only fires events to be used
                          as you please.
                        -->
                        <div id="submenu-patas" class="popover">
                            <h3 class="popover-title">Patas</h3>
                            <div class="popover-content"><img src="images/patas.png"></div>
                        </div>
                    </li>
                    <li data-submenu-id="submenu-snub-nosed">
                        <a href="#">Golden Snub-Nosed</a>
                        <div id="submenu-snub-nosed" class="popover">
                            <h3 class="popover-title">Golden Snub-Nosed</h3>
                            <div class="popover-content"><img src="images/snub-nosed.png"></div>
                        </div>
                    </li>
                    <li data-submenu-id="submenu-duoc-langur">
                        <a href="#">Duoc Langur</a>
                        <div id="submenu-duoc-langur" class="popover">
                            <h3 class="popover-title">Duoc Langur</h3>
                            <div class="popover-content"><img src="images/duoc-langur.png"></div>
                        </div>
                    </li>
                    <li data-submenu-id="submenu-pygmy">
                        <a href="#">Baby Pygmy Marmoset</a>
                        <div id="submenu-pygmy" class="popover">
                            <h3 class="popover-title">Baby Pygmy Marmoset</h3>
                            <div class="popover-content"><img src="images/pygmy.png"></div>
                        </div>
                    </li>
                    <li data-submenu-id="submenu-tamarin">
                        <a href="#">Black Lion Tamarin</a>
                        <div id="submenu-tamarin" class="popover">
                            <h3 class="popover-title">Black Lion Tamarin</h3>
                            <div class="popover-content"><img src="images/tamarin.png"></div>
                        </div>
                    </li>
                    <li data-submenu-id="submenu-monk">
                        <a href="#">Monk Saki</a>
                        <div id="submenu-monk" class="popover">
                            <h3 class="popover-title">Monk Saki</h3>
                            <div class="popover-content"><img src="images/monk.png"></div>
                        </div>
                    </li>
                    <li data-submenu-id="submenu-gabon">
                        <a href="#">Gabon Talapoin</a>
                        <div id="submenu-gabon" class="popover">
                            <h3 class="popover-title">Gabon</h3>
                            <div class="popover-content"><img src="images/gabon.png"></div>
                        </div>
                    </li>
                    <li data-submenu-id="submenu-grivet">
                        <a href="#">Grivet</a>
                        <div id="submenu-grivet" class="popover">
                            <h3 class="popover-title">Grivet</h3>
                            <div class="popover-content"><img src="images/grivet.png"></div>
                        </div>
                    </li>
                    <li data-submenu-id="submenu-red-leaf">
                        <a href="#">Red Leaf</a>
                        <div id="submenu-red-leaf" class="popover">
                            <h3 class="popover-title">Red Leaf</h3>
                            <div class="popover-content"><img src="images/red-leaf.png"></div>
                        </div>
                    </li>
                    <li data-submenu-id="submenu-king-colobus">
                        <a href="#">King Colobus</a>
                        <div id="submenu-king-colobus" class="popover">
                            <h3 class="popover-title">King Colobus</h3>
                            <div class="popover-content"><img src="images/colobus.png"></div>
                        </div>
                    </li>
                     <li data-submenu-id="submenu-king-colobus">
                        <a href="#">King Colobus</a>
                        <div id="submenu-king-colobus" class="popover">
                            <h3 class="popover-title">King Colobus</h3>
                            <div class="popover-content"><img src="images/colobus.png"></div>
                        </div>
                    </li>
                     <li data-submenu-id="submenu-king-colobus">
                        <a href="#">King Colobus</a>
                        <div id="submenu-king-colobus" class="popover">
                            <h3 class="popover-title">King Colobus</h3>
                            <div class="popover-content"><img src="images/colobus.png"></div>
                        </div>
                    </li>
                     <li data-submenu-id="submenu-king-colobus">
                        <a href="#">King Colobus</a>
                        <div id="submenu-king-colobus" class="popover">
                            <h3 class="popover-title">King Colobus</h3>
                            <div class="popover-content"><img src="images/colobus.png"></div>
                        </div>
                    </li>
                     <li data-submenu-id="submenu-king-colobus">
                        <a href="#">King Colobus</a>
                        <div id="submenu-king-colobus" class="popover">
                            <h3 class="popover-title">King Colobus</h3>
                            <div class="popover-content"><img src="images/colobus.png"></div>
                        </div>
                    </li>
                     <li data-submenu-id="submenu-king-colobus">
                        <a href="#">King Colobus</a>
                        <div id="submenu-king-colobus" class="popover">
                            <h3 class="popover-title">King Colobus</h3>
                            <div class="popover-content"><img src="images/colobus.png"></div>
                        </div>
                    </li>
                     <li data-submenu-id="submenu-king-colobus">
                        <a href="#">King Colobus</a>
                        <div id="submenu-king-colobus" class="popover">
                            <h3 class="popover-title">King Colobus</h3>
                            <div class="popover-content"><img src="images/colobus.png"></div>
                        </div>
                    </li>
                     <li data-submenu-id="submenu-king-colobus">
                        <a href="#">King Colobus</a>
                        <div id="submenu-king-colobus" class="popover">
                            <h3 class="popover-title">King Colobus</h3>
                            <div class="popover-content"><img src="images/colobus.png"></div>
                        </div>
                    </li>
                     <li data-submenu-id="submenu-king-colobus">
                        <a href="#">King Colobus</a>
                        <div id="submenu-king-colobus" class="popover">
                            <h3 class="popover-title">King Colobus</h3>
                            <div class="popover-content"><img src="images/colobus.png"></div>
                        </div>
                    </li>
                    
                     <li data-submenu-id="submenu-king-colobus">
                        <a href="#">King Colobus</a>
                        <div id="submenu-king-colobus" class="popover">
                            <h3 class="popover-title">King Colobus</h3>
                            <div class="popover-content"><img src="images/colobus.png"></div>
                        </div>
                    </li>
                </ul>
              </li>
            </ul>
          </div>
      </div>
    </div>
    <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.menu-aim.js" type="text/javascript"></script>
    <script src="scripts/bootstrap.min.js" type="text/javascript"></script>
    <script>

        var $menu = $(".dropdown-menu");

        // jQuery-menu-aim: <meaningful part of the example>
        // Hook up events to be fired on menu row activation.
        $menu.menuAim({
            activate: activateSubmenu,
            deactivate: deactivateSubmenu
        });
        // jQuery-menu-aim: </meaningful part of the example>

        // jQuery-menu-aim: the following JS is used to show and hide the submenu
        // contents. Again, this can be done in any number of ways. jQuery-menu-aim
        // doesn't care how you do this, it just fires the activate and deactivate
        // events at the right times so you know when to show and hide your submenus.
        function activateSubmenu(row) {
            var $row = $(row),
                submenuId = $row.data("submenuId"),
                $submenu = $("#" + submenuId),
                height = $menu.outerHeight(),
                width = $menu.outerWidth();

            // Show the submenu
            $submenu.css({
                display: "block",
                top: -1,
                left: width - 3,  // main should overlay submenu
                height: height - 4  // padding for main dropdown's arrow
            });

            // Keep the currently activated row's highlighted look
            $row.find("a").addClass("maintainHover");
        }

        function deactivateSubmenu(row) {
            var $row = $(row),
                submenuId = $row.data("submenuId"),
                $submenu = $("#" + submenuId);

            // Hide the submenu and remove the row's highlighted look
            $submenu.css("display", "none");
            $row.find("a").removeClass("maintainHover");
        }

        // Bootstrap's dropdown menus immediately close on document click.
        // Don't let this event close the menu if a submenu is being clicked.
        // This event propagation control doesn't belong in the menu-aim plugin
        // itself because the plugin is agnostic to bootstrap.
        $(".dropdown-menu li").click(function(e) {
            e.stopPropagation();
        });

        $(document).click(function() {
            // Simply hide the submenu on any click. Again, this is just a hacked
            // together menu/submenu structure to show the use of jQuery-menu-aim.
            $(".popover").css("display", "none");
            $("a.maintainHover").removeClass("maintainHover");
        });

    </script>
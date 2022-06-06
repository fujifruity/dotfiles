;; This is an operating system configuration generated
;; by the graphical installer.

(use-modules 
  (gnu) 
  (gnu packages haskell-apps) ; for kmonad
  (nongnu system linux-initrd) 
  (nongnu packages linux))
(use-service-modules
  cups
  desktop
  networking
  ssh
  xorg
  nix)
(use-package-modules package-management)

(define %my-desktop-services
  (modify-services %desktop-services 
    (udev-service-type config => 
                       (udev-configuration 
                         (inherit config) 
                         (rules (cons kmonad (udev-configuration-rules config))))) ; for kmonad
    (delete gdm-service-type)))

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "Asia/Tokyo")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "guixpad")
  (users (cons* (user-account
                  (name "fuji")
                  (comment "fuji")
                  (group "users")
                  (home-directory "/home/fuji")
                  (supplementary-groups
                    '("wheel" "netdev" "audio" "video"
                      "input" ; for kmonad
                      )))
                %base-user-accounts))
  (packages
    (append
      (list (specification->package "i3-wm")
            (specification->package "i3status")
            (specification->package "dmenu")
            (specification->package "st")
            (specification->package "nss-certs"))
      %base-packages))
  (services
    (append
      (list (service cups-service-type)
            (service nix-service-type))
      %my-desktop-services))
  (bootloader
    (bootloader-configuration
      (bootloader grub-efi-bootloader)
      (targets (list "/boot/efi"))
      (timeout 1)
      (keyboard-layout keyboard-layout)))
  (swap-devices
    (list (swap-space
            (target
              (uuid "0af8b5c8-9d5d-4260-a94f-0cb96f6c782a")))))
  (file-systems
    (cons* (file-system
             (mount-point "/boot/efi")
             (device (uuid "E274-CCB9" 'fat32))
             (type "vfat"))
           (file-system
             (mount-point "/")
             (device
               (uuid "223832c9-6cc7-4352-a248-b85c0ede8971"
                     'ext4))
             (type "ext4"))
           %base-file-systems)))

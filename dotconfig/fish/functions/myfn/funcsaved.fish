function funcsaved --wraps='funcsave' --description 'alias funcsaved=funcsave -d ~/.config/fish/functions/myfn'
  funcsave -d ~/.config/fish/functions/myfn $argv; 
end

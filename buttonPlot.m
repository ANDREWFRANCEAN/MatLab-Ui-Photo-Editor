
function buttonPlot
% Create a figure window
f = figure;
f.WindowState = 'maximized';

global currentImage;
global initialImage;
currentImage=[];

%STATIC TEXT
uicontrol('Style', 'text', 'String', 'ADOBI Photo Editor', ...
    'Position', [5, 300 200 40], 'FontName', 'Bahnschrift ', 'FontSize', 16, 'ForegroundColor', 'black', 'BackgroundColor','#B4B4B4' );
uicontrol('Style', 'text', 'String', 'Contrast', ...
    'Position', [1, 220 200 40], 'FontName', 'Bahnschrift ', 'FontSize', 10, 'ForegroundColor', 'black', 'BackgroundColor','#B4B4B4' );
uicontrol('Style', 'text', 'String', 'By Frincean Andrei', ...
    'Position', [5, 270 200 40], 'FontName', 'Bahnschrift', 'FontSize', 12, 'ForegroundColor', 'black', 'BackgroundColor','#B4B4B4' );
set(gcf,'color','#B4B4B4')
uicontrol('Style', 'text', 'String', '2022-2023 Adobi. All rights reserved', ...
    'Position', [1440 3 300 40], 'FontName', 'Bahnschrift ', 'FontSize', 10, 'ForegroundColor', '#767676', 'BackgroundColor','#B4B4B4' );

% Creating a push buttons


my_button = uicontrol( 'Style', 'pushbutton', 'String' , 'Upload IMG',...
    'Position', [20 10 180 50],...
    'Callback', @upload_callback);

my_button2 = uicontrol('Style', 'pushbutton', 'String', ' B&W ',...
    'Position', [200 10 150 40],...
    'Callback', @bw_callback);
my_button3 = uicontrol('Style', 'pushbutton', 'String', ' HUE+ ',...
    'Position', [350 10 150 40],...
    'Callback', @hueup_callback);
my_button4 = uicontrol('Style', 'pushbutton', 'String', ' HUE- ',...
    'Position', [500 10 150 40],...
    'Callback', @huedown_callback);
my_button5 = uicontrol('Style', 'pushbutton', 'String', ' RESET ',...
    'Position', [650 10 150 40],...
    'Callback', @reset_callback);
my_button6 = uicontrol('Style', 'pushbutton', 'String', ' Histogram ',...
    'Position', [20 70 150 40],...
    'Callback', @histogram_callback);
my_button7 = uicontrol('Style', 'pushbutton', 'String', ' Exposure+ ',...
    'Position', [20 120 150 40],...
    'Callback', @exposureup_callback);
my_button8 = uicontrol('Style', 'pushbutton', 'String', ' Exposure- ',...
    'Position', [20 170 150 40],...
    'Callback', @exposuredown_callback);
my_button9 = uicontrol('Style', 'pushbutton', 'String', ' Stop music ',...
    'Position', [1550 60 150 40],...
    'Callback', @audiostop_callback);
my_button10 = uicontrol('Style', 'pushbutton', 'String', ' Play music ',...
    'Position', [1550 110 150 40],...
    'Callback', @audioplay_callback);
my_button11 = uicontrol('Style', 'pushbutton', 'String', ' About me ',...
    'Position', [1550 160 150 40],...
    'Callback', @surprise_callback);
my_button12 = uicontrol('Style', 'pushbutton', 'String', '  ! ',...
    'Position', [1550 210 150 40],...
    'Callback', @warning_Callback);
my_button13 = uicontrol('Style', 'pushbutton', 'String', ' X ',...
    'Position', [1650 790 40 40],...
    'Callback', @close_callback);
my_button14 = uicontrol('Style', 'pushbutton', 'String', ' Documentation ',...
    'Position', [1490 790 150 40],...
    'Callback', @open_pdf);

% Slider
contrast_slider = uicontrol('Style', 'slider', 'Min', 0, 'Max', 10, ...
    'Value', 0, 'Position', [20 220 150 25]);
set(my_button, 'BackgroundColor', 'red')
set(my_button9, 'BackgroundColor', 'red')
set(my_button13, 'BackgroundColor', 'red')
set(my_button10, 'BackgroundColor', 'green')
% Afisarea imaginii default
    function initializeDefaultMedia
        currentImage=imread('nomedia.jpg');
        imshow(currentImage);
    end

initializeDefaultMedia;
% Functions to be called when button is pressed:
    function upload_callback(hObject,eventdata) %Upload picture function
        
        uploadImage=uigetfile('*.*');
        currentImage=imread(uploadImage);
        initialImage=currentImage;
        imshow(currentImage)

    end

    function bw_callback(hObject,eventdata)%transforms the image in B&W
        % Load image

        I = im2gray(currentImage);
        currentImage=I
        imshow(currentImage);

    end
    function hueup_callback(hObject,eventdata) %HUE+ function

        rgbImage = currentImage
        k = 3;
        hsvImage = rgb2hsv(rgbImage);
        hsvImage(:,:,1) = mod(hsvImage(:,:,1)*k,1);
        rgbImage = hsv2rgb(hsvImage);
        currentImage=rgbImage;
        imshow(currentImage);

    end

    function huedown_callback(hObject,eventdata) %HUE- function

        rgbImage =currentImage
        k = -3;
        hsvImage = rgb2hsv(rgbImage);
        hsvImage(:,:,1) = mod(hsvImage(:,:,1)*k,1);
        rgbImage = hsv2rgb(hsvImage);
        imshow(rgbImage);
    end
    function reset_callback(hObject,eventdata)  % RESET

        imshow(initialImage);
        currentImage=initialImage
    end

    function histogram_callback(hObject,eventdata) %opens the histogram
        ;
        img=rgb2gray(currentImage);

        [x, y] = size(img);
        frequency = 1 : 256;
        count = 0;

        for i = 1 : 256
            for j = 1 : x
                for k = 1 : y
                    if img(j, k) == i-1
                        count = count + 1;
                    end
                end
            end
            frequency(i) = count;
            count = 0;
        end

        n = 0 : 255;

        % Display Histogram
        h = stem(n, frequency);
        grid on;
        title('HISTOGRAM OF THE IMAGE');
        set(h, 'ButtonDownFcn', @(src,evnt) delete_hist(src,evnt));
    end
    function exposureup_callback(hObject,eventdata) %Exposure+ function
        
        I = currentImage ;
        I1 = I+20 ;
        currentImage=I1
        imshow(currentImage) ;

    end

    function exposuredown_callback(hObject,eventdata) %Exposure- function

        I = currentImage ;
        I1 = I-20 ;
        currentImage=I1
        imshow(currentImage) ;

    end

    function audiostop_callback(hObject,eventdata) %Pauses the music
        global p
        [y,Fs]=audioread("Wires.mp3");
        player=audioplayer(y,Fs);
        p=player;
        play(p);
        pause(player)

    end
    function audioplay_callback(hObject,eventdata) %Plays the music
        global p
        [y,Fs]=audioread("Wires.mp3");
        player=audioplayer(y,Fs);
        p=player;
        play(p);


    end

    function surprise_callback(hObject,eventdata) %Opens smth

        url = 'https://www.instagram.com/franceanandrei/';
        web(url)

    end


set(contrast_slider, 'Callback', @contrast_callback);% Callback slider.

    function contrast_callback(hObject, eventdata)
        % Get the current value of the slider
        contrastValue = get(hObject, 'Value');
        if contrastValue < 0
            contrastValue = -contrastValue;
        end
        % Adjust the contrast of the image
        contrast_image = imadjust(currentImage, [], [], contrastValue);
        currentImage = contrast_image;

        % Update the RGB channels
        currentImage_r = currentImage(:, :, 1);
        currentImage_g = currentImage(:, :, 1);
        currentImage_b = currentImage(:, :, 1);

        imshow(currentImage);
    end
    function warning_Callback(hObject, eventdata)

        opts = struct('WindowStyle','modal',...
            'Interpreter','tex');
        f = warndlg('\color{black} Press OK if you love Miha<3',...
            ' Warning!!!', opts);
    end
function close_callback(hObject,eventdata)
     close(gcf)
end
       function open_pdf(~,~)
        pdf_path = 'doc2.pdf';
        
            winopen(pdf_path);
        
    end
end
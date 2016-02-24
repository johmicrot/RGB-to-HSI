function [ hue,sat,int ] = rgb2hsi( rgb_img )
I = imread(rgb_img);
rChan = double(I(:,:,1));
gChan = double(I(:,:,2));
bChan = double(I(:,:,3));
[length,width,~] = size(I);
sat = zeros(length,width);
hue = sat;
int =(rChan + gChan + bChan)/300;
for x = 1:size(I,1)
    for y = 1:size(I,2)
        sat(x,y) = 1 - (3/(rChan(x,y) + gChan(x,y) + bChan(x,y)))*min([rChan(x,y),gChan(x,y),bChan(x,y)]);
        hue(x,y) = acos((0.5*(2*rChan(x,y)-gChan(x,y)-bChan(x,y)))/sqrt((rChan(x,y)-gChan(x,y))^2 + (rChan(x,y)-bChan(x,y))*(gChan(x,y)-bChan(x,y))));
        if (bChan(x,y) > gChan(x,y))
            hue(x,y) = 360 -hue(x,y);
        end
    end
end

end


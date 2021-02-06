class ImageUploader < CarrierWave::Uploader::Base

   # Include RMagick or MiniMagick support: 
   #include CarrierWave::RMagick 
# minimagickを使うため
   include CarrierWave::MiniMagick 

#サムネイルの為に画像をリサイズ
   version :thumb do 
     process resize_to_fit: [200, 200] 
   end 
  version :thumb50 do 
    process resize_to_fit: [100, 100] 
  end 
end
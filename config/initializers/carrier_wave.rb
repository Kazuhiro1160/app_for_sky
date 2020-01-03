if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
        # Amazon S3用の設定
        :provider              => 'AWS',
        :region                => ENV['ap-northeast-1'],     # 例: 'ap-northeast-1'
        :aws_access_key_id     => ENV['AKIAWNRTPOS3L6UW37XZ'],
        :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['bucket-for-slat']
  end
end
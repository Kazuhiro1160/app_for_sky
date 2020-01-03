if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
        # Amazon S3用の設定
        :provider              => 'AWS',
        :region                => ENV['ap-northeast-1'],     # 例: 'ap-northeast-1'
        :aws_access_key_id     => ENV['AKIAX67STLBEZZHNNSUS'],
        :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['app-slat-bucket']
  end
end
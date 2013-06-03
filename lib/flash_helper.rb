module FlashHelper
  
  def flash_error(options = {})
    msg = options[:message] || :error
    flash_notice message: msg, kind: :error, now: now
  end

  def flash_notice(options = {})
    msg = options[:message] || :notice
    msg = flash_translate msg if msg.is_a?(Symbol)
    kind = options[:kind] || :notice

    flash[kind] = msg
  end

  def flash_translate(key)
    scope = [:flash, :controllers]
    scope += params[:controller].split('/')
    scope << params[:action]

    t(key, scope: scope)
  end

end
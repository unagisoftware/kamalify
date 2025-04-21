# frozen_string_literal: true

class BuilderConfig < BaseConfig
  private

  def values
    {
      arch:,
      remote:
    }
  end

  def arch
    return if @params[:arch].blank? || @params[:arch] == "default"

    @params[:arch].presence
  end

  def remote
    @params[:remote].presence
  end

  def defaults
    { arch: "default" }
  end

  def optional?
    true
  end
end

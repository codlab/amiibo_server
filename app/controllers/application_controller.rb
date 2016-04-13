class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :html, :json, :text, :pdf
  before_filter :default_format, :set_header, :check_seed

  CURRENT_REVISION = 4

  def default_format
    logger.info(params[:format])
    request.format = "json" unless params[:format]
  end

  def set_header
    if params[:format].blank?
      headers["Content-Type"] = "text/plain"
    end
  end

  def check_seed
    revision = 0
    if not Revision.order("revision DESC").first.nil?
      logger.info("having revision #{Revision.order("revision DESC").first} #{Revision.order("revision DESC").first.revision}")
      revision = Revision.order("revision DESC").first.revision
    end

    logger.info("havin revision -#{revision}-")
    if revision < CURRENT_REVISION
      Revision.destroy_all
      AmiiboId.destroy_all

      insert_if_not_exists_revision(1)
      insert_if_not_exists_revision(2)
      insert_if_not_exists_revision(3)

      insert_if_not_exists("SMB - Bowser", "0005000000390102")
      insert_if_not_exists("SMB - Luigi", "0001000000350102")
      insert_if_not_exists("SMB - Mario", "0000000000340102")
      insert_if_not_exists("SMB - Mario - Gold Edition", "00000000003C0102")
      insert_if_not_exists("SMB - Mario - Silver Edition", "00000000003D0102")
      insert_if_not_exists("SMB - Peach", "0002000000360102")
      insert_if_not_exists("SMB - Yoshi", "0003000000370102")
      insert_if_not_exists("SMB - Toad", "000a000000380102")

      insert_if_not_exists("SSB - Bowser", "0005000000140002")
      insert_if_not_exists("SSB - Captain Falcon", "0600000000120002")
      insert_if_not_exists("SSB - Charizard", "1906000000240002")
      insert_if_not_exists("SSB - Diddy Kong", "00090000000d0002")
      insert_if_not_exists("SSB - Donkey Kong", "0008000000030002")
      insert_if_not_exists("SSB - Fox", "0580000000050002")
      insert_if_not_exists("SSB - Greninja", "1b92000000250002")
      insert_if_not_exists("SSB - Ike", "2101000000180002")
      insert_if_not_exists("SSB - Jigglypuff", "1927000000260002")
      insert_if_not_exists("SSB - King Dedede", "1f02000000280002")
      insert_if_not_exists("SSB - Kirby", "1f000000000a0002")
      insert_if_not_exists("SSB - Link", "0100000000040002")
      insert_if_not_exists("SSB - Little Mac", "06c00000000f0002")
      insert_if_not_exists("SSB - Lucario", "1ac0000000110002")
      insert_if_not_exists("SSB - Luigi", "00010000000c0002")
      insert_if_not_exists("SSB - Marth", "21000000000b0002")
      insert_if_not_exists("SSB - Mario", "0000000000000002")
      insert_if_not_exists("SSB - Mega Man", "3480000000310002")
      insert_if_not_exists("SSB - Meta-Knight", "1f01000000270002")
      insert_if_not_exists("SSB - Ness", "22800000002c0002")
      insert_if_not_exists("SSB - Pac-Man", "3340000000320002")
      insert_if_not_exists("SSB - Peach", "0002000000010002")
      insert_if_not_exists("SSB - Pikachu", "1919000000090002")
      insert_if_not_exists("SSB - Pit", "0740000000100002")
      insert_if_not_exists("SSB - Rosalina & Luma", "0004010000130002")
      insert_if_not_exists("SSB - Samus", "05c0000000060002")
      insert_if_not_exists("SSB - Sheik", "0101010000170002")
      insert_if_not_exists("SSB - Shulk", "22400000002b0002")
      insert_if_not_exists("SSB - Sonic", "3200000000300002")
      insert_if_not_exists("SSB - Toon Link", "0100010000160002")
      insert_if_not_exists("SSB - Villager", "0180000000080002")
      insert_if_not_exists("SSB - Wario", "00070000001a0002")
      insert_if_not_exists("SSB - Wii Fit Trainer", "0700000000070002")
      insert_if_not_exists("SSB - Yoshi", "0003000000020002")
      insert_if_not_exists("SSB - Zelda", "01010000000e0002")

      insert_if_not_exists("Splatoon - Boy", "08000200003f0402")
      insert_if_not_exists("Splatoon - Girl", "08000100003e0402")
      insert_if_not_exists("Splatoon - Squid", "0800030000400402")


      insert_if_not_exists_revision(4)
      insert_if_not_exists("SMB - Mario - 8-Bit Classic Colors", "0000000002380602")
      insert_if_not_exists("SMB - Mario - 8-Bit Modern Colors", "0000000002390602")
      insert_if_not_exists("SP - Yoshi - Green", "0003010200410302")
      insert_if_not_exists("SP - Yoshi - Pink", "0003010200420302")
      insert_if_not_exists("SP - Yoshi - Blue", "0003010200430302")
      insert_if_not_exists("SP - Yoshi - Mega", "00030102023e0302")
      insert_if_not_exists("Skylanders - Donkey Kong", "0008FF00023B0702")
      insert_if_not_exists("Skylanders - Bowser", "0005ff00023a0702")
      insert_if_not_exists("SSB - Mega Man - Gold", "3480000002580002")
      insert_if_not_exists("SSB - Lucina", "2102000000290002")
      insert_if_not_exists("SSB - Robin", "21030000002a0002")

      insert_if_not_exists("SSB - Bowser Jr.", "0006000000150002")
      insert_if_not_exists("SSB - Dark Pit", "0741000000200002")
      insert_if_not_exists("SSB - Dr. Mario", "0000010000190002")
      insert_if_not_exists("SSB - Ganondorf", "01020100001B0002")
      insert_if_not_exists("SSB - Olimar", "06400100001E0002")
      insert_if_not_exists("SSB - Palutena", "07420000001F0002")
      insert_if_not_exists("SSB - Zero Suit Samus", "05C00100001D0002")
      insert_if_not_exists("SSB - Duck Hunt", "07820000002F0002")
      insert_if_not_exists("SSB - Mr. G&W", "07800000002D0002")
      insert_if_not_exists("SSB - R.O.B., Famicom", "07810000002E0002")
      insert_if_not_exists("SSB - R.O.B., NES", "0781000000330002")
      insert_if_not_exists("SSB - Mii Brawler", "07C0000000210002")
      insert_if_not_exists("SSB - Mii Gunner", "07C0010000230002")
      insert_if_not_exists("SSB - Mii Swordfighter", "07C0010000220002")
      insert_if_not_exists("SSB - Falco", "05810000001C0002")
      insert_if_not_exists("SSB - Mewtwo", "19960000023D0002")
      insert_if_not_exists("Pokken - Mewtwo", "1D000001025C0D02")
      insert_if_not_exists("SSB - Lucas", "2281000002510002")
      insert_if_not_exists("SSB - Roy", "2104000002520002")
      insert_if_not_exists("SSB - Ryu", "34C0000002530002")

      insert_if_not_exists("CHI - Chibi Robo", "22C00000003A0202")
      insert_if_not_exists("SHK - Shovel Knight", "35C0000002500A02")
      insert_if_not_exists("LOZ - Midna", "01030000024F0902")
      #insert_if_not_exists("SSB - Cloud Strife", "21030000002a0002")
      #insert_if_not_exists("SSB - Corrin", "21030000002a0002")
      #insert_if_not_exists("SSB - Bayonetta", "21030000002a0002")
    end
  end

  private

  def insert_if_not_exists(name, identifier)
    identifier = identifier.downcase
    amiibo = AmiiboId.where(:identifier => identifier).first
    logger.info("amiibo? #{amiibo}")
    AmiiboId.create({:name => name, :identifier => identifier}) if amiibo.nil?
  end

  def insert_if_not_exists_revision(revision)
    rev = Revision.where(:revision => revision).first
    logger.info("revision? #{revision}")
    Revision.create({:revision => revision}) if rev.nil?
  end
end

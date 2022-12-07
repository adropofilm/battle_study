defmodule Encryption.AES do
  @aad "AES256GCM" # Use AES 256 Bit Keys for Encryption.

  def encrypt(plaintext) do
    iv = :crypto.strong_rand_bytes(16) # create random Initialisation Vector
    key = get_key()    # get the *latest* key in the list of encryption keys
    {ciphertext, tag} =
      :crypto.crypto_one_time_aead(:aes_256_gcm, key, iv, to_string(plaintext), @aad, true)
    iv <> tag <> ciphertext # "return" iv with the cipher tag & ciphertext
  end

  def decrypt(ciphertext) do
    <<iv::binary-16, tag::binary-16, ciphertext::binary>> =
      ciphertext
    :crypto.crypto_one_time_aead(:aes_256_gcm, get_key(), iv, ciphertext, @aad, tag, false)
  end

  defp get_key do # this is a "dummy function" we will update it in step 3.3
    <<109, 182, 30, 109, 203, 207, 35, 144, 228, 164, 106, 244, 38, 242,
    106, 19, 58, 59, 238, 69, 2, 20, 34, 252, 122, 232, 110, 145, 54,
    241, 65, 16>> # return a random 32 Byte / 128 bit binary to use as key.
  end
end

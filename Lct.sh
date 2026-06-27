actd tx lctmanager register-lct \
  --lct-id "lct://sage:thinker:expert_42@testnet" \
  --public-key "0x..." \
  --metadata "trust_threshold=0.75,capabilities=text-generation" \
  --from user
actd tx lctmanager create-pairing \
  --source-lct "lct://sage:thinker:expert_42@testnet" \
  --target-lct "lct://web4-agent:guardian:coordinator@testnet" \
  --from user

actd query lctmanager get-pairing \
  --source-lct "lct://sage:thinker:expert_42@testnet" \
  --target-lct "lct://web4-agent:guardian:coordinator@testnet"
actd query lctmanager get-pairing \
  --source-lct "lct://sage:thinker:expert_42@testnet" \
  --target-lct "lct://web4-agent:guardian:coordinator@testnet"

actd query trusttensor calculate-relationship-trust \
  --lct-id "lct://sage:thinker:expert_42@testnet" \
  --context "energy_operation"

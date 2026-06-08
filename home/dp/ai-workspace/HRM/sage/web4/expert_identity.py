class ExpertIdentityBridge:
    def __init__(self, namespace: str = "sage", instance: str = "thinker",
                 network: str = "testnet"):
        self.namespace = namespace
        self.instance = instance
        self.network = network

    def expert_to_lct_uri(self, expert_id: int) -> str:
        """Convert expert ID to full LCT URI."""
        return f"lct://{self.namespace}:{self.instance}:expert_{expert_id}@{self.network}"

    def lct_uri_to_expert(self, lct_uri: str) -> int:
        """Parse LCT URI to extract expert ID."""
        # Parse: lct://sage:thinker:expert_42@testnet → 42
        match = re.match(r"lct://([^:]+):([^:]+):expert_(\d+)@([^?#]+)", lct_uri)
        if not match:
            raise ValueError(f"Invalid SAGE expert LCT URI: {lct_uri}")
        return int(match.group(3))

    def validate_lct_uri(self, lct_uri: str) -> bool:
        """Validate LCT URI format and component namespace."""
        try:
            parsed = parse_lct_uri(lct_uri)
            return (parsed.component == self.namespace and
                    parsed.instance == self.instance)
        except Exception:
            return False

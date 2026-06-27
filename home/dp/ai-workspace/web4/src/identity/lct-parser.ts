def migrate_legacy_expert_id(legacy_id: str, network: str = "testnet") -> str:
    """Convert legacy SAGE expert ID to LCT URI."""
    # Parse: sage_thinker_expert_42
    parts = legacy_id.split("_")
    if len(parts) != 4 or parts[2] != "expert":
        raise ValueError(f"Invalid legacy expert ID: {legacy_id}")

    component = parts[0]  # sage
    instance = parts[1]   # thinker
    role = f"expert_{parts[3]}"  # expert_42

    return f"lct://{component}:{instance}:{role}@{network}"

func MigrateLegacyLCTID(legacyID string, network string) string {
    // If already a URI, return as-is
    if strings.HasPrefix(legacyID, "lct://") {
        return legacyID
    }

    // Otherwise, assume format: component_instance_role
    parts := strings.Split(legacyID, "_")
    if len(parts) < 3 {
        return fmt.Sprintf("lct://unknown:unknown:%s@%s", legacyID, network)
    }

    return fmt.Sprintf("lct://%s:%s:%s@%s",
        parts[0], parts[1], parts[2], network)
}

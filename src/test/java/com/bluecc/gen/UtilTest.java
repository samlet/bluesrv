package com.bluecc.gen;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UtilTest {

    @Test
    void toSnakecase() {
        assertEquals(Util.toSnakecase("PartyGroup"), "party_group");
        assertEquals(Util.toSnakecase("partyGroup"), "party_group");
    }
}


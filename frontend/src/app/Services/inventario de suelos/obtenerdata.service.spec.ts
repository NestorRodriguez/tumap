import { TestBed } from '@angular/core/testing';

import { ObtenerdataService } from './obtenerdata.service';

describe('ObtenerdataService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ObtenerdataService = TestBed.get(ObtenerdataService);
    expect(service).toBeTruthy();
  });
});

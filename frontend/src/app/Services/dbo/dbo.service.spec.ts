import { TestBed } from '@angular/core/testing';

import { DboService } from './dbo.service';

describe('DboService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: DboService = TestBed.get(DboService);
    expect(service).toBeTruthy();
  });
});
